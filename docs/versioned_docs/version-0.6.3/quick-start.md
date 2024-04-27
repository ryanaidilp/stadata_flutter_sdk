---
sidebar_position: 2
---

# Quick Start

Follow these steps to quickly integrate the Stadata Flutter SDK into your Flutter project.

## Update Your Dependency

First, ensure that your `stadata_flutter_sdk` dependency is up-to-date by including the latest version in your `pubspec.yaml` file. You can check the latest available version on [pub.dev](https://pub.dev/packages/stadata_flutter_sdk).

```yaml
dependencies:
  stadata_flutter_sdk: ^latest_version
```

Replace `^latest_version` with the actual latest version number.

## Install Dependencies

After updating your `pubspec.yaml`, run the following command to fetch and install the SDK package:

```bash
flutter pub get
```

You can also install it from the `cli` by using this command

```sh
flutter pub add stadata_flutter_sdk
```

## Initialize SDK

Initialize the Stadata Flutter SDK in your `main.dart` file and make sure to include your API token. Replace `'YOUR_API_KEY'` with your actual API key obtained from the [Web API BPS](https://webapi.bps.go.id/developer).

```dart
import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the StadataFlutter instance with your API key
  await StadataFlutter.instance.init(
    apiKey: 'YOUR_API_KEY',
  );

  // Your app's entry point
  runApp(MyApp());
}
```

:::caution Important Notes

Make sure you called `WidgetsFlutterBinding.ensureInitialized()` before initializing the SDK and make sure you initialize the SDK before calling `runApp()`!

:::

## Start Using STADATA Flutter SDK

With the SDK initialized, you're ready to start using the Stadata API within your Flutter app. Refer to the SDK's documentation and examples to learn how to retrieve data and integrate it into your application.

```dart
// Example: Fetching data using the SDK
final response = await StadataFlutter.instance.list.domains();
// Handle the response and update your app's UI as needed.
```

That's it! You've successfully integrated the Stadata Flutter SDK into your project. You can now start utilizing the data and features provided by Stadata in your Flutter app.

Now, you're ready to explore the capabilities of the `STADATA Flutter SDK` in your Flutter application.
