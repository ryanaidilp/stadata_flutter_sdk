import os
import json
import requests
from pathlib import Path

def main():
    release_version = os.getenv("RELEASE_VERSION")
    release_name = os.getenv("RELEASE_NAME")
    release_url = os.getenv("RELEASE_URL")
    release_body = os.getenv("RELEASE_BODY", "")
    repo_name = os.getenv("REPO_NAME")
    publisher = os.getenv("PUBLISHER")
    discord_map_json = os.getenv("DISCORD_MAP")

    # Parse GitHub -> Discord map from secrets
    discord_map = json.loads(discord_map_json) if discord_map_json else {}

    # Mention the publisher
    publisher_mention = f"<@{discord_map.get(publisher)}>" if publisher in discord_map else f"@{publisher}"

    # Extract package name from repo
    package_name = "stadata_flutter_sdk"
    
    # Create pub.dev URL
    pubdev_url = f"https://pub.dev/packages/{package_name}/versions/{release_version}"
    
    # Create APK download URL
    apk_url = f"https://github.com/{repo_name}/releases/download/{release_version}/Stadata_Example_v{release_version}.apk"
    
    # Process release notes (limit length for Discord)
    release_notes = ""
    if release_body:
        # Take first 500 characters and add ellipsis if truncated
        notes = release_body.strip()
        if len(notes) > 500:
            notes = notes[:500] + "..."
        release_notes = f"\n\n**📋 Release Notes:**\n```\n{notes}\n```"

    # Compose the message with emojis and formatting
    message = (
        f"🎉 **New Release Published!**\n\n"
        f"📦 **Package:** `{package_name}`\n"
        f"🏷️ **Version:** `{release_version}`\n"
        f"👤 **Published by:** {publisher_mention}\n\n"
        f"🔗 **Links:**\n"
        f"• [GitHub Release]({release_url})\n"
        f"• [pub.dev Package]({pubdev_url})\n"
        f"• [📱 Example APK]({apk_url})\n"
        f"• [Installation Guide](https://pub.dev/packages/{package_name}/install)"
        f"{release_notes}\n\n"
        f"🛠️ **Quick Install:**\n"
        f"```yaml\n"
        f"dependencies:\n"
        f"  {package_name}: ^{release_version}\n"
        f"```\n\n"
        f"🚀 Happy coding! Time to update your dependencies! 🎊"
    )

    # Send to Discord
    webhook = os.getenv("DISCORD_RELEASE_WEBHOOK")
    if not webhook:
        print("❌ DISCORD_RELEASE_WEBHOOK not configured")
        return

    # Discord embed for better formatting
    embed = {
        "title": f"🎉 New Release: {package_name} v{release_version}",
        "description": f"Published by {publisher_mention}",
        "color": 0x00FF00,  # Green color
        "url": release_url,
        "fields": [
            {
                "name": "📦 Package",
                "value": f"[{package_name}]({pubdev_url})",
                "inline": True
            },
            {
                "name": "🏷️ Version", 
                "value": f"`{release_version}`",
                "inline": True
            },
            {
                "name": "🔗 Quick Install",
                "value": f"```yaml\ndependencies:\n  {package_name}: ^{release_version}\n```",
                "inline": False
            },
            {
                "name": "📱 Example App APK",
                "value": f"[📥 Download Stadata_Example_v{release_version}.apk]({apk_url})",
                "inline": False
            }
        ],
        "footer": {
            "text": "STADATA Flutter SDK • pub.dev",
            "icon_url": "https://dart.dev/assets/img/shared/dart/icon/64.png"
        },
        "timestamp": None  # Discord will use current time
    }

    # Add release notes field if available
    if release_body and len(release_body.strip()) > 0:
        notes = release_body.strip()
        if len(notes) > 1000:  # Discord field value limit
            notes = notes[:1000] + "..."
        embed["fields"].append({
            "name": "📋 Release Notes",
            "value": notes,
            "inline": False
        })

    payload = {
        "content": f"🚀 **New Release Alert!** @here",
        "embeds": [embed]
    }

    try:
        response = requests.post(webhook, json=payload)
        response.raise_for_status()
        print("✅ Release notification sent to Discord.")
        print(f"📦 Package: {package_name}")
        print(f"🏷️ Version: {release_version}")
        print(f"🔗 pub.dev: {pubdev_url}")
    except requests.exceptions.RequestException as e:
        print(f"❌ Failed to send Discord notification: {e}")
        print(f"Response: {response.text if 'response' in locals() else 'No response'}")

if __name__ == "__main__":
    main()