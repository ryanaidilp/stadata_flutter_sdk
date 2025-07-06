import os
import json
import requests
import yaml
from pathlib import Path

def get_package_info():
    """Get package name and current version from pubspec.yaml"""
    pubspec_path = Path("packages/stadata_flutter_sdk/pubspec.yaml")
    if not pubspec_path.exists():
        print("❌ pubspec.yaml not found")
        return None, None
    
    with open(pubspec_path, 'r') as f:
        pubspec = yaml.safe_load(f)
    
    return pubspec.get('name'), pubspec.get('version')

def get_pubdev_version(package_name):
    """Get the latest version from pub.dev"""
    try:
        response = requests.get(f"https://pub.dev/api/packages/{package_name}")
        response.raise_for_status()
        data = response.json()
        return data.get('latest', {}).get('version')
    except requests.exceptions.RequestException as e:
        print(f"❌ Failed to fetch pub.dev info: {e}")
        return None

def get_last_notified_version():
    """Get the last version we notified about from GitHub Actions cache/artifacts"""
    # For now, we'll use a simple approach with environment variables
    # In a production setup, you might want to use GitHub's cache or artifacts
    return os.getenv("LAST_NOTIFIED_VERSION")

def should_notify(local_version, pubdev_version, last_notified, force_check):
    """Determine if we should send a notification"""
    if force_check:
        return True
    
    if not pubdev_version:
        return False
    
    # If local version matches pub.dev version and we haven't notified about this version
    if local_version == pubdev_version and pubdev_version != last_notified:
        return True
    
    return False

def send_discord_notification(package_name, version, discord_webhook, discord_map):
    """Send Discord notification about new pub.dev release"""
    pubdev_url = f"https://pub.dev/packages/{package_name}/versions/{version}"
    package_url = f"https://pub.dev/packages/{package_name}"
    
    # Get package description from pub.dev API
    try:
        response = requests.get(f"https://pub.dev/api/packages/{package_name}")
        response.raise_for_status()
        package_data = response.json()
        description = package_data.get('latest', {}).get('pubspec', {}).get('description', '')
    except:
        description = "Flutter SDK for accessing BPS Indonesia statistical data"

    embed = {
        "title": f"📦 Package Published to pub.dev!",
        "description": f"**{package_name}** version `{version}` is now available",
        "color": 0x0175C2,  # pub.dev blue color
        "url": pubdev_url,
        "fields": [
            {
                "name": "📦 Package",
                "value": f"[{package_name}]({package_url})",
                "inline": True
            },
            {
                "name": "🏷️ Version", 
                "value": f"`{version}`",
                "inline": True
            },
            {
                "name": "📄 Description",
                "value": description[:200] + ("..." if len(description) > 200 else ""),
                "inline": False
            },
            {
                "name": "🚀 Quick Install",
                "value": f"```yaml\ndependencies:\n  {package_name}: ^{version}\n```",
                "inline": False
            },
            {
                "name": "🔗 Useful Links",
                "value": f"• [pub.dev Package]({package_url})\n• [API Documentation]({package_url}/doc/api)\n• [Example Usage]({package_url}/example)\n• [Changelog]({package_url}/changelog)",
                "inline": False
            }
        ],
        "footer": {
            "text": "pub.dev notification • Automatically detected",
            "icon_url": "https://dart.dev/assets/img/shared/dart/icon/64.png"
        },
        "timestamp": None
    }

    payload = {
        "content": f"🎉 **New Package Version on pub.dev!** @here",
        "embeds": [embed]
    }

    try:
        response = requests.post(discord_webhook, json=payload)
        response.raise_for_status()
        print("✅ pub.dev notification sent to Discord.")
        return True
    except requests.exceptions.RequestException as e:
        print(f"❌ Failed to send Discord notification: {e}")
        return False

def main():
    discord_webhook = os.getenv("DISCORD_RELEASE_WEBHOOK")
    discord_map_json = os.getenv("DISCORD_MAP", "{}")
    force_check = os.getenv("FORCE_CHECK", "false").lower() == "true"
    
    if not discord_webhook:
        print("❌ DISCORD_WEBHOOK not configured")
        return

    # Parse Discord map
    discord_map = json.loads(discord_map_json)
    
    # Get package information
    package_name, local_version = get_package_info()
    if not package_name or not local_version:
        print("❌ Could not determine package name or version")
        return
    
    print(f"📦 Package: {package_name}")
    print(f"🏷️ Local version: {local_version}")
    
    # Get pub.dev version
    pubdev_version = get_pubdev_version(package_name)
    print(f"🌐 pub.dev version: {pubdev_version}")
    
    # Get last notified version (simplified approach)
    last_notified = get_last_notified_version()
    print(f"🔔 Last notified: {last_notified}")
    
    # Check if we should notify
    if should_notify(local_version, pubdev_version, last_notified, force_check):
        print(f"📤 Sending notification for version {pubdev_version}")
        success = send_discord_notification(package_name, pubdev_version, discord_webhook, discord_map)
        
        if success:
            # In a real implementation, you'd want to store this persistently
            print(f"✅ Successfully notified about version {pubdev_version}")
            # You could use GitHub's cache action or artifacts to store this
            # For now, we'll just output it
            print(f"::set-output name=notified_version::{pubdev_version}")
        else:
            print("❌ Failed to send notification")
    else:
        print("ℹ️ No notification needed")
        print(f"  Local: {local_version}")
        print(f"  pub.dev: {pubdev_version}")
        print(f"  Last notified: {last_notified}")
        print(f"  Force check: {force_check}")

if __name__ == "__main__":
    main()