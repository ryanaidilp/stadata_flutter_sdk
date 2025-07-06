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

## Features Demonstrated in the Example App

The example app showcases all the SDK's capabilities, including:

### Content Data

- **Publications**: Browse statistical publications
- **Press Releases**: View official BPS announcements
- **News**: Read statistical news and updates
- **Infographics**: Explore visual statistical presentations
- **Static Tables**: Access pre-compiled statistical tables

### Census Data ⭐ **New**

- **Census Types**: Browse all available census events (Population, Agricultural, Economic)
- **Census Topics**: Explore topics within each census (Demographics, Housing, Employment, etc.)
- **Census Datasets**: Access specific datasets for detailed analysis

### Classification and Structure

- **Domains**: Navigate regional hierarchies
- **Subject Categories & Subjects**: Browse statistical topics
- **Statistical Classifications**: Explore KBLI and KBKI classifications
- **Strategic Indicators**: View key performance metrics
- **Units, Variables & Vertical Variables**: Understand data structures

### Interactive Features

- **Bilingual Support**: Switch between Indonesian and English
- **Search and Filtering**: Find specific data efficiently
- **Pagination**: Navigate through large datasets
- **Detailed Views**: Access comprehensive information about each item

The example app serves as both a demonstration and a learning resource for implementing the SDK in your own applications.
