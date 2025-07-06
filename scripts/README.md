# Scripts

This directory contains utility scripts for the STADATA Flutter SDK project.

## 📝 Changelog Generation

### generate-changelog.sh

A convenient shell script for generating changelogs from git commits using conventional commit format.

#### Features

- ✅ **Conventional Commits**: Parses conventional commit format automatically
- ✅ **Interactive Mode**: Prompts for confirmation before making changes
- ✅ **Git Integration**: Automatically detects tags and commit ranges
- ✅ **Flexible Output**: Support for different output formats and destinations
- ✅ **Backup Safety**: Creates backups before updating main changelog
- ✅ **Git Commit**: Optional automatic commit of changelog updates

#### Quick Start

```bash
# Generate changelog since last tag (interactive mode)
./scripts/generate-changelog.sh --preview --update-main

# Generate for specific version
./scripts/generate-changelog.sh --version 1.0.0 --update-main

# Preview without changes
./scripts/generate-changelog.sh --dry-run

# Generate with specific commit types only
./scripts/generate-changelog.sh --types feat,fix,docs --version 1.0.0
```

#### Options

| Option | Description | Example |
|--------|-------------|---------|
| `--version VERSION` | Version for changelog entry | `--version 1.0.0` |
| `--from-tag TAG` | Generate from this tag | `--from-tag v0.8.0` |
| `--types TYPES` | Comma-separated commit types | `--types feat,fix,docs` |
| `--update-main` | Update main CHANGELOG.md | `--update-main` |
| `--preview` | Show preview and ask confirmation | `--preview` |
| `--dry-run` | Show what would be generated | `--dry-run` |
| `--help` | Show help message | `--help` |

#### Commit Types

The script recognizes these conventional commit types:

- 🎉 **feat**: New features
- 🐛 **fix**: Bug fixes
- 📚 **docs**: Documentation changes
- 💄 **style**: Code style changes
- ♻️ **refactor**: Code refactoring
- ⚡ **perf**: Performance improvements
- ✅ **test**: Test additions/updates
- 🔧 **chore**: Maintenance tasks
- 👷 **ci**: CI/CD changes
- 📦 **build**: Build system changes
- ⏪ **revert**: Reverts
- 💥 **breaking**: Breaking changes (detected by `!` suffix)

### Python Script (.github/scripts/generate_changelog.py)

The underlying Python script that powers the shell script. Can be used directly for more advanced scenarios:

```bash
# Generate changelog since last tag
python3 .github/scripts/generate_changelog.py --version 1.0.0 --include-author

# Generate for specific tag range
python3 .github/scripts/generate_changelog.py --from-tag v0.8.0 --to-tag v0.8.1

# Generate JSON format
python3 .github/scripts/generate_changelog.py --format json --output changelog.json

# Generate since specific date
python3 .github/scripts/generate_changelog.py --since "2024-01-01"
```

## 🔄 GitHub Workflows

### generate-changelog.yml

Automatically generates changelogs when:
- A new tag is pushed (triggers automatically)
- Manually triggered via workflow dispatch

#### Features

- ✅ **Automatic Tag Detection**: Detects version from git tags
- ✅ **Pull Request Creation**: Creates PR with changelog updates
- ✅ **Artifact Upload**: Saves changelog files as artifacts
- ✅ **Manual Trigger**: Supports manual execution with custom parameters

#### Manual Trigger Parameters

| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `version` | Version for changelog | ✅ | - |
| `from_tag` | Start tag for range | ❌ | Latest tag |
| `include_types` | Commit types to include | ❌ | All types |
| `create_pr` | Create pull request | ❌ | `false` |

## 🎯 Usage Examples

### Local Development

```bash
# Quick update for new version
./scripts/generate-changelog.sh --version 1.2.0 --preview --update-main

# Generate only for important changes
./scripts/generate-changelog.sh --types feat,fix --version 1.2.0 --update-main

# Safe preview mode
./scripts/generate-changelog.sh --dry-run
```

### CI/CD Integration

The GitHub workflow automatically:
1. Detects new tags
2. Generates appropriate changelog
3. Creates pull request with changes
4. Uploads artifacts for review

### Manual GitHub Action

1. Go to **Actions** → **Generate Changelog**
2. Click **Run workflow**
3. Fill in parameters
4. Choose whether to create a PR

## 📋 Best Practices

### Commit Messages

Use conventional commit format for best results:

```bash
# Good examples
git commit -m "feat(auth): add OAuth2 authentication"
git commit -m "fix(api): handle null response data"
git commit -m "docs(readme): update installation instructions"
git commit -m "feat!: migrate to new API format"  # Breaking change

# Less ideal
git commit -m "update stuff"
git commit -m "fix bug"
```

### Workflow Integration

1. **Development**: Use the shell script locally for testing
2. **Release**: Let GitHub Actions handle automatic generation
3. **Review**: Always review generated changelogs before merging

### Version Management

- Use semantic versioning (e.g., `1.2.3`)
- Tag releases consistently
- Include breaking change indicators (`!`) in commit messages

## 🚀 Getting Started

1. **Make script executable** (if needed):
   ```bash
   chmod +x scripts/generate-changelog.sh
   ```

2. **Test with dry run**:
   ```bash
   ./scripts/generate-changelog.sh --dry-run
   ```

3. **Generate your first changelog**:
   ```bash
   ./scripts/generate-changelog.sh --version 1.0.0 --preview --update-main
   ```

4. **Review and commit**:
   The script will prompt you to commit the changes automatically.

## 📚 Additional Resources

- [Conventional Commits Specification](https://www.conventionalcommits.org/)
- [Keep a Changelog](https://keepachangelog.com/)
- [Semantic Versioning](https://semver.org/)

---

💡 **Tip**: Always use `--preview` mode when trying new options to see what will be generated before making changes.