import os
import json
import re
from pathlib import Path
import requests

def main():
    pr_title = os.getenv("PR_TITLE")
    pr_url = os.getenv("PR_URL")
    pr_author = os.getenv("PR_AUTHOR")
    repo_name = os.getenv("REPO_NAME")
    discord_map_json = os.getenv("DISCORD_MAP")

    # Parse mapping from secret
    discord_map = json.loads(discord_map_json)

    # Read CODEOWNERS
    codeowners_path = Path(".github/CODEOWNERS")
    owner_lines = codeowners_path.read_text().splitlines()

    github_mentions = set()
    for line in owner_lines:
        if line.strip().startswith("#") or not line.strip():
            continue
        owners = re.findall(r"@([a-zA-Z0-9_-]+)", line)
        github_mentions.update(owners)

    discord_mentions = []
    for gh_user in github_mentions:
        discord_id = discord_map.get(gh_user)
        if discord_id:
            discord_mentions.append(f"<@{discord_id}>")

    mentions = " ".join(discord_mentions) if discord_mentions else "Tidak ada code owner terdeteksi."
    message = (
        f"📣 Pull Request Baru di **{repo_name}** oleh **{pr_author}**\n"
        f"🔗 [{pr_title}]({pr_url})\n"
        f"{mentions} mohon review ya 🙏"
    )

    webhook = os.getenv("DISCORD_WEBHOOK")
    response = requests.post(webhook, json={"content": message})
    response.raise_for_status()

if __name__ == "__main__":
    main()
