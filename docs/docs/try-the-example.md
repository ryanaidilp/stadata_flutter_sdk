---
sidebar_position: 2
---

# Try the Example

You can explore the capabilities of the Stadata Flutter SDK by checking out the example app provided in the [SDK's GitHub repository](https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/app/example).

To run the example app and see the SDK in action, follow these steps:

1. Create an .env file in the example directory or copy it from .env.example:

   ```bash
   cp .env.example .env
   ```

2. Copy your `API_KEY` to the .env file:

   ```dotenv
   API_KEY=  # Put your API Key here
   ```

3. Generate `env.g.dart` by running the following command in the example directory:

   ```bash
   dart run build_runner build -d
   ```

   If the build is successful, it will generate the necessary code.

4. Run the example app:

   ```bash
   flutter run
   ```

Now, you're ready to explore the capabilities of the Stadata Flutter SDK in your Flutter application using the example provided. This example will help you understand how to integrate and use the SDK effectively in your own projects.
