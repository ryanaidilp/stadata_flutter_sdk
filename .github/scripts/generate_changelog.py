#!/usr/bin/env python3
"""
Changelog Generator Script

This script generates a changelog from git commits following conventional commit format.
It supports various output formats and can be used in CI/CD pipelines.

Usage:
    python generate_changelog.py [options]

Examples:
    # Generate changelog since last tag
    python generate_changelog.py

    # Generate changelog for specific version range
    python generate_changelog.py --from-tag v0.8.0 --to-tag v0.8.1

    # Generate changelog since specific date
    python generate_changelog.py --since "2024-01-01"

    # Output to file
    python generate_changelog.py --output CHANGELOG_NEW.md

    # Generate only for specific types
    python generate_changelog.py --types feat,fix,docs
"""

import argparse
import re
import subprocess
import sys
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple
import json

class ChangelogGenerator:
    """Generate changelog from git commits using conventional commit format."""
    
    # Conventional commit types and their descriptions
    COMMIT_TYPES = {
        'feat': '🎉 Features',
        'fix': '🐛 Bug Fixes', 
        'docs': '📚 Documentation',
        'style': '💄 Styles',
        'refactor': '♻️ Code Refactoring',
        'perf': '⚡ Performance Improvements',
        'test': '✅ Tests',
        'chore': '🔧 Chores',
        'ci': '👷 CI/CD',
        'build': '📦 Build System',
        'revert': '⏪ Reverts',
        'breaking': '💥 BREAKING CHANGES'
    }
    
    def __init__(self):
        self.repo_path = Path.cwd()
        
    def run_git_command(self, cmd: List[str]) -> str:
        """Run a git command and return the output."""
        try:
            result = subprocess.run(
                ['git'] + cmd,
                cwd=self.repo_path,
                capture_output=True,
                text=True,
                check=True
            )
            return result.stdout.strip()
        except subprocess.CalledProcessError as e:
            print(f"Error running git command: {e}")
            print(f"Command: git {' '.join(cmd)}")
            print(f"Error output: {e.stderr}")
            sys.exit(1)
    
    def get_latest_tag(self) -> Optional[str]:
        """Get the latest git tag."""
        try:
            output = self.run_git_command(['tag', '--sort=-version:refname'])
            tags = output.split('\n')
            return tags[0] if tags and tags[0] else None
        except:
            return None
    
    def get_commits_since(self, since_ref: Optional[str] = None, until_ref: str = 'HEAD') -> List[Dict]:
        """Get commits since a specific reference."""
        cmd = ['log', '--pretty=format:%H|%s|%an|%ad|%b', '--date=short']
        
        if since_ref:
            cmd.append(f'{since_ref}..{until_ref}')
        else:
            # If no reference provided, get commits since last tag
            latest_tag = self.get_latest_tag()
            if latest_tag:
                cmd.append(f'{latest_tag}..{until_ref}')
        
        output = self.run_git_command(cmd)
        
        if not output:
            return []
        
        commits = []
        for line in output.split('\n'):
            if not line.strip():
                continue
                
            parts = line.split('|', 4)
            if len(parts) >= 4:
                commit_hash = parts[0]
                subject = parts[1]
                author = parts[2]
                date = parts[3]
                body = parts[4] if len(parts) > 4 else ''
                
                commit_info = self.parse_conventional_commit(subject)
                commits.append({
                    'hash': commit_hash,
                    'hash_short': commit_hash[:7],
                    'subject': subject,
                    'author': author,
                    'date': date,
                    'body': body,
                    'type': commit_info['type'],
                    'scope': commit_info['scope'],
                    'description': commit_info['description'],
                    'breaking': commit_info['breaking'],
                    'is_conventional': commit_info['is_conventional']
                })
        
        return commits
    
    def parse_conventional_commit(self, subject: str) -> Dict:
        """Parse a conventional commit message."""
        # Pattern for conventional commits: type(scope): description
        pattern = r'^([a-zA-Z]+)(\([^)]+\))?(!)?: (.+)$'
        match = re.match(pattern, subject)
        
        if match:
            commit_type = match.group(1).lower()
            scope = match.group(2)[1:-1] if match.group(2) else None  # Remove parentheses
            breaking = match.group(3) == '!'
            description = match.group(4)
            
            return {
                'type': commit_type,
                'scope': scope,
                'description': description,
                'breaking': breaking,
                'is_conventional': True
            }
        else:
            return {
                'type': 'other',
                'scope': None,
                'description': subject,
                'breaking': False,
                'is_conventional': False
            }
    
    def group_commits_by_type(self, commits: List[Dict], include_types: Optional[List[str]] = None) -> Dict[str, List[Dict]]:
        """Group commits by their type."""
        grouped = {}
        
        for commit in commits:
            commit_type = commit['type']
            
            # Filter by types if specified
            if include_types and commit_type not in include_types:
                continue
            
            # Handle breaking changes
            if commit['breaking']:
                commit_type = 'breaking'
            
            if commit_type not in grouped:
                grouped[commit_type] = []
            
            grouped[commit_type].append(commit)
        
        return grouped
    
    def format_commit_entry(self, commit: Dict, include_hash: bool = True, include_author: bool = False) -> str:
        """Format a single commit entry."""
        entry = f"- {commit['description']}"
        
        if commit['scope']:
            entry = f"- **{commit['scope']}**: {commit['description']}"
        
        parts = []
        
        if include_hash:
            repo_url = self.get_repo_url()
            if repo_url:
                parts.append(f"[{commit['hash_short']}]({repo_url}/commit/{commit['hash']})")
            else:
                parts.append(f"`{commit['hash_short']}`")
        
        if include_author:
            parts.append(f"by @{commit['author']}")
        
        if parts:
            entry += f" ({', '.join(parts)})"
        
        return entry
    
    def get_repo_url(self) -> Optional[str]:
        """Get the repository URL from git remote."""
        try:
            output = self.run_git_command(['remote', 'get-url', 'origin'])
            # Convert SSH URL to HTTPS
            if output.startswith('git@github.com:'):
                return output.replace('git@github.com:', 'https://github.com/').replace('.git', '')
            elif output.startswith('https://github.com/'):
                return output.replace('.git', '')
            return output
        except:
            return None
    
    def generate_markdown_changelog(
        self, 
        commits: List[Dict], 
        version: Optional[str] = None,
        include_types: Optional[List[str]] = None,
        include_hash: bool = True,
        include_author: bool = False
    ) -> str:
        """Generate changelog in markdown format."""
        
        if not commits:
            return "No commits found for the specified range.\n"
        
        # Group commits by type
        grouped_commits = self.group_commits_by_type(commits, include_types)
        
        if not grouped_commits:
            return "No commits found matching the specified types.\n"
        
        # Generate changelog content
        changelog_lines = []
        
        # Header
        if version:
            changelog_lines.append(f"## {version}")
        else:
            changelog_lines.append(f"## {datetime.now().strftime('%Y-%m-%d')}")
        
        changelog_lines.append("")
        
        # Breaking changes first
        if 'breaking' in grouped_commits:
            changelog_lines.append("### 💥 BREAKING CHANGES")
            changelog_lines.append("")
            for commit in grouped_commits['breaking']:
                changelog_lines.append(self.format_commit_entry(commit, include_hash, include_author))
            changelog_lines.append("")
        
        # Other commit types
        for commit_type in ['feat', 'fix', 'docs', 'style', 'refactor', 'perf', 'test', 'chore', 'ci', 'build', 'revert']:
            if commit_type in grouped_commits and commit_type != 'breaking':
                type_name = self.COMMIT_TYPES.get(commit_type, commit_type.title())
                changelog_lines.append(f"### {type_name}")
                changelog_lines.append("")
                
                for commit in grouped_commits[commit_type]:
                    changelog_lines.append(self.format_commit_entry(commit, include_hash, include_author))
                
                changelog_lines.append("")
        
        # Other/non-conventional commits
        if 'other' in grouped_commits:
            changelog_lines.append("### 📝 Other Changes")
            changelog_lines.append("")
            for commit in grouped_commits['other']:
                changelog_lines.append(self.format_commit_entry(commit, include_hash, include_author))
            changelog_lines.append("")
        
        # Add statistics
        changelog_lines.append("---")
        changelog_lines.append("")
        total_commits = len(commits)
        contributors = len(set(commit['author'] for commit in commits))
        changelog_lines.append(f"**Summary**: {total_commits} commits from {contributors} contributors")
        changelog_lines.append("")
        
        return '\n'.join(changelog_lines)
    
    def generate_json_changelog(self, commits: List[Dict], version: Optional[str] = None) -> str:
        """Generate changelog in JSON format."""
        grouped_commits = self.group_commits_by_type(commits)
        
        changelog_data = {
            'version': version or datetime.now().strftime('%Y-%m-%d'),
            'date': datetime.now().isoformat(),
            'total_commits': len(commits),
            'contributors': list(set(commit['author'] for commit in commits)),
            'changes': grouped_commits
        }
        
        return json.dumps(changelog_data, indent=2)

def main():
    parser = argparse.ArgumentParser(
        description='Generate changelog from git commits using conventional commit format',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )
    
    parser.add_argument(
        '--from-tag', 
        help='Generate changelog from this tag (exclusive)'
    )
    
    parser.add_argument(
        '--to-tag', 
        default='HEAD',
        help='Generate changelog to this tag (inclusive, default: HEAD)'
    )
    
    parser.add_argument(
        '--since',
        help='Generate changelog since this date (e.g., "2024-01-01")'
    )
    
    parser.add_argument(
        '--version',
        help='Version for the changelog entry'
    )
    
    parser.add_argument(
        '--output', '-o',
        help='Output file path (default: stdout)'
    )
    
    parser.add_argument(
        '--format',
        choices=['markdown', 'json'],
        default='markdown',
        help='Output format (default: markdown)'
    )
    
    parser.add_argument(
        '--types',
        help='Comma-separated list of commit types to include (e.g., "feat,fix,docs")'
    )
    
    parser.add_argument(
        '--no-hash',
        action='store_true',
        help='Don\'t include commit hashes in output'
    )
    
    parser.add_argument(
        '--include-author',
        action='store_true',
        help='Include commit authors in output'
    )
    
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Show what would be generated without writing to file'
    )
    
    args = parser.parse_args()
    
    generator = ChangelogGenerator()
    
    # Determine commit range
    since_ref = None
    if args.from_tag:
        since_ref = args.from_tag
    elif args.since:
        since_ref = args.since
    
    # Get commits
    commits = generator.get_commits_since(since_ref, args.to_tag)
    
    if not commits:
        print("No commits found for the specified range.")
        return
    
    # Parse include types
    include_types = None
    if args.types:
        include_types = [t.strip() for t in args.types.split(',')]
    
    # Generate changelog
    if args.format == 'json':
        changelog_content = generator.generate_json_changelog(commits, args.version)
    else:
        changelog_content = generator.generate_markdown_changelog(
            commits, 
            args.version,
            include_types,
            not args.no_hash,
            args.include_author
        )
    
    # Output
    if args.dry_run:
        print("=== DRY RUN ===")
        print(f"Would generate changelog with {len(commits)} commits")
        print(f"Range: {since_ref or 'last tag'} to {args.to_tag}")
        print(f"Format: {args.format}")
        if args.output:
            print(f"Output file: {args.output}")
        print("\n=== PREVIEW ===")
        print(changelog_content[:500] + "..." if len(changelog_content) > 500 else changelog_content)
    elif args.output:
        with open(args.output, 'w', encoding='utf-8') as f:
            f.write(changelog_content)
        print(f"Changelog written to {args.output}")
    else:
        print(changelog_content)

if __name__ == '__main__':
    main()