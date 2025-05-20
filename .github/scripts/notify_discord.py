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

    # Parse GitHub -> Discord map from secrets
    discord_map = json.loads(discord_map_json)

    # Mention the PR author
    pr_author_mention = f"<@{discord_map.get(pr_author)}>" if pr_author in discord_map else f"@{pr_author}"

    # Read .github/CODEOWNERS
    codeowners_path = Path(".github/CODEOWNERS")
    if not codeowners_path.exists():
        print("⚠️ No CODEOWNERS file found.")
        owners = []
    else:
        lines = codeowners_path.read_text().splitlines()
        owners = set()
        for line in lines:
            if line.strip().startswith("#") or not line.strip():
                continue
            owners.update(re.findall(r"@([a-zA-Z0-9_-]+)", line))

    # Remove the author from the list of codeowners
    reviewers = owners - {pr_author}

    # Convert GitHub usernames to Discord mentions if available
    if reviewers:
        reviewer_mentions = [
            f"<@{discord_map.get(user)}>" if user in discord_map else f"@{user}"
            for user in reviewers
        ]
        mentions = " ".join(reviewer_mentions)
    else:
        mentions = "Tidak ada reviewer lain yang terdeteksi."

    # Compose the message
    message = (
        f"📣 Pull Request Baru di **{repo_name}** oleh {pr_author_mention}\n"
        f"🔗 [{pr_title}]({pr_url})\n"
        f"{mentions} mohon review ya 🙏"
    )

    # Send to Discord
    webhook = os.getenv("DISCORD_WEBHOOK")
    response = requests.post(webhook, json={"content": message})
    response.raise_for_status()
    print("✅ Notifikasi dikirim ke Discord.")

if __name__ == "__main__":
    main()
