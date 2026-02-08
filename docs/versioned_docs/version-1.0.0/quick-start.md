---
sidebar_position: 2
---

# Quick Start

Get started with the STADATA Flutter SDK in minutes! This comprehensive guide will walk you through setting up the SDK, obtaining your API key, and implementing your first statistical data integration with BPS (Badan Pusat Statistik) Indonesia.

The STADATA Flutter SDK provides seamless access to Indonesia's official statistical data, enabling you to integrate economic indicators, demographic data, publications, news, and more into your Flutter applications with just a few lines of code.

## Prerequisites

Before getting started, ensure your development environment meets these requirements:

- **Flutter SDK**: Version 3.7.0 or higher
- **Dart SDK**: Version 2.19.0 or higher
- **Platform Support**: Android, iOS, Web, Desktop (Windows, macOS, Linux)
- **API Key**: Valid API key from [BPS Web API](https://webapi.bps.go.id/developer/)

### Verify Your Flutter Installation

```bash
# Check Flutter version
flutter --version

# Verify Flutter installation
flutter doctor
```

## Step 1: API Key Registration

Before using the SDK, you'll need to register for a free API key from BPS:

1. **Visit the BPS Developer Portal**: [https://webapi.bps.go.id/developer/](https://webapi.bps.go.id/developer/)
2. **Create an Account**: Register with your email and complete verification
3. **Generate API Key**: Navigate to your dashboard and create a new API key
4. **Note the Key**: Save your API key securely - you'll need it for initialization

:::tip API Key Best Practices

- Store your API key securely using environment variables or Flutter's secure storage
- Never commit API keys to version control
- Use different API keys for development, staging, and production environments
- Monitor your API usage through the BPS developer dashboard
  :::

## Step 2: Installation

### Option A: Add via pubspec.yaml

Add the STADATA Flutter SDK to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  stadata_flutter_sdk: ^latest_version
```

Replace `^latest_version` with the actual latest version from [pub.dev](https://pub.dev/packages/stadata_flutter_sdk).

### Option B: Add via Command Line

Use Flutter's pub command to add the dependency automatically:

```bash
flutter pub add stadata_flutter_sdk
```

### Install Dependencies

Fetch and install the SDK package:

```bash
flutter pub get
```

## Step 3: SDK Initialization

Initialize the STADATA Flutter SDK in your application's entry point. This should be done before running your app.

### Basic Initialization

```dart
import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the STADATA Flutter SDK
  await StadataFlutter.instance.init(
    apiKey: 'YOUR_API_KEY_HERE',
  );

  // Launch your application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STADATA Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const StatisticalDataScreen(),
    );
  }
}
```

### Secure API Key Management

For production applications, use secure storage for your API key:

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Load API key from secure storage or environment
    const apiKey = String.fromEnvironment(
      'BPS_API_KEY',
      defaultValue: '', // Never use actual key as default
    );

    if (apiKey.isEmpty) {
      throw Exception('BPS API Key not found. Please check your configuration.');
    }

    // Initialize with secure API key
    await StadataFlutter.instance.init(apiKey: apiKey);

    runApp(const MyApp());
  } catch (e) {
    // Handle initialization errors gracefully
    runApp(ErrorApp(error: e.toString()));
  }
}

class ErrorApp extends StatelessWidget {
  final String error;

  const ErrorApp({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Initialization Error', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(error, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
```

:::caution Critical Initialization Steps

1. **Always call** `WidgetsFlutterBinding.ensureInitialized()` before SDK initialization
2. **Initialize the SDK** before calling `runApp()`
3. **Handle initialization errors** gracefully to prevent app crashes
4. **Validate your API key** before initialization to catch configuration issues early
   :::

## Step 4: Your First Implementation

Now let's implement a complete example that demonstrates the core functionality of the STADATA Flutter SDK.

### Complete Example: Indonesian Domains Explorer

```dart
import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StatisticalDataScreen extends StatefulWidget {
  const StatisticalDataScreen({super.key});

  @override
  State<StatisticalDataScreen> createState() => _StatisticalDataScreenState();
}

class _StatisticalDataScreenState extends State<StatisticalDataScreen> {
  List<Domain> domains = [];
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadDomains();
  }

  Future<void> _loadDomains() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Fetch Indonesian administrative domains
      final result = await StadataFlutter.instance.list.domains(
        type: DomainType.all,
        lang: DataLanguage.id,
      );

      setState(() {
        domains = result.data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load domains: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indonesian Administrative Domains'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadDomains,
            tooltip: 'Refresh Data',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading Indonesian domains...'),
          ],
        ),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error Loading Data',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loadDomains,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (domains.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('No domains found'),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Summary header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Administrative Domains',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                '${domains.length} domains available',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        // Domains list
        Expanded(
          child: ListView.builder(
            itemCount: domains.length,
            itemBuilder: (context, index) {
              final domain = domains[index];
              return _buildDomainCard(domain);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDomainCard(Domain domain) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            domain.id.length >= 2 ? domain.id.substring(0, 2) : domain.id,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          domain.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Domain ID: ${domain.id}'),
            Text('URL: ${domain.url}'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => _showDomainDetails(domain),
        ),
        onTap: () => _showDomainDetails(domain),
      ),
    );
  }

  void _showDomainDetails(Domain domain) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(domain.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Domain ID', domain.id),
            _buildDetailRow('Name', domain.name),
            _buildDetailRow('URL', domain.url),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _exploreData(domain);
            },
            child: const Text('Explore Data'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  void _exploreData(Domain domain) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DomainDataExplorer(domain: domain),
      ),
    );
  }
}

// Additional screen for exploring domain-specific data
class DomainDataExplorer extends StatefulWidget {
  final Domain domain;

  const DomainDataExplorer({super.key, required this.domain});

  @override
  State<DomainDataExplorer> createState() => _DomainDataExplorerState();
}

class _DomainDataExplorerState extends State<DomainDataExplorer> {
  int publicationCount = 0;
  int newsCount = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDomainData();
  }

  Future<void> _loadDomainData() async {
    try {
      // Load publications and news for this domain
      final [publications, news] = await Future.wait([
        StadataFlutter.instance.list.publications(domain: widget.domain.id),
        StadataFlutter.instance.list.news(domain: widget.domain.id),
      ]);

      setState(() {
        publicationCount = publications.data.length;
        newsCount = news.data.length;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading domain data: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.domain.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Domain Information',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow('ID', widget.domain.id),
                          _buildInfoRow('Name', widget.domain.name),
                          _buildInfoRow('URL', widget.domain.url),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Available Data',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 12),
                          _buildDataRow(
                            'Publications',
                            publicationCount,
                            Icons.book,
                            Colors.blue,
                          ),
                          _buildDataRow(
                            'News Articles',
                            newsCount,
                            Icons.article,
                            Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, int count, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## Step 5: Exploring SDK Features

Now that you have a working implementation, explore the comprehensive capabilities of the STADATA Flutter SDK:

### List API - Data Discovery

The List API helps you discover and browse collections of statistical data:

```dart
// Discover publications
final publications = await StadataFlutter.instance.list.publications(
  domain: '0000', // National level
  keyword: 'ekonomi', // Economic data
  lang: DataLanguage.id,
);

// Browse news articles
final news = await StadataFlutter.instance.list.news(
  domain: '3200', // West Java
  lang: DataLanguage.id,
);

// Find static tables
final tables = await StadataFlutter.instance.list.staticTables(
  domain: '0000',
  keyword: 'inflasi',
);
```

### View API - Detailed Information

The View API provides comprehensive details about specific items:

```dart
// Get detailed publication information
final publication = await StadataFlutter.instance.view.publication(
  id: '03220.2301',
  domain: '0000',
  lang: DataLanguage.id,
);

// Access publication details
if (publication != null) {
  print('Title: ${publication.title}');
  print('Abstract: ${publication.abstract}');
  print('PDF URL: ${publication.pdf}');
  print('File Size: ${publication.size}');
}
```

### Error Handling Best Practices

Implement robust error handling for production applications:

```dart
Future<void> fetchDataSafely() async {
  try {
    final result = await StadataFlutter.instance.list.domains();
    // Handle successful response
    print('Loaded ${result.data.length} domains');
  } on ApiKeyNotFoundException {
    // Handle API key issues
    print('Invalid or missing API key');
  } on ApiException catch (e) {
    // Handle API communication errors
    print('API Error: ${e.message}');
  } on NetworkException {
    // Handle network connectivity issues
    print('Network connection failed');
  } catch (e) {
    // Handle unexpected errors
    print('Unexpected error: $e');
  }
}
```

## Next Steps

Congratulations! You've successfully integrated the STADATA Flutter SDK. Here's what to explore next:

### 📚 Deep Dive into Documentation

- **[List API Documentation](./api-docs/list/intro)** - Discover all available data collections
- **[View API Documentation](./api-docs/view/intro)** - Learn about detailed data retrieval
- **[Usage Guide](./usage/list)** - Comprehensive usage patterns and examples

### 🛠 Advanced Implementation

- **State Management**: Integrate with providers like Riverpod, Bloc, or GetX
- **Caching**: Implement data caching for offline capabilities
- **Performance**: Optimize for large datasets and complex queries
- **UI Components**: Build reusable widgets for statistical data display

### 📱 Example Application

Explore the complete example application included with the SDK:

```bash
# Navigate to the example app
cd example

# Install dependencies
flutter pub get

# Run the example application
flutter run
```

### 🔧 SDK Configuration

The STADATA Flutter SDK has a simple configuration with only the API key required:

```dart
// SDK initialization - only API key is configurable
await StadataFlutter.instance.init(
  apiKey: 'YOUR_API_KEY', // Required: Your BPS API key
);
```

**Note**: The SDK uses default settings for all other configurations including base URL, timeouts, and language preferences, which can be specified per API call when needed.

### 🚀 Production Checklist

Before deploying your application:

- [ ] **Secure API Key**: Store API key securely, never in source code
- [ ] **Error Handling**: Implement comprehensive error handling
- [ ] **Loading States**: Provide user feedback during data loading
- [ ] **Offline Support**: Handle network connectivity issues
- [ ] **Performance**: Optimize for your specific use case
- [ ] **Testing**: Write tests for your statistical data integration
- [ ] **Documentation**: Document your implementation for team members

## Support and Resources

Need help or have questions?

- **📖 Documentation**: Complete API reference and guides
- **💬 Issues**: Report bugs or request features on [GitHub](https://github.com/ryanaidilp/stadata_flutter_sdk/issues)
- **📧 BPS Support**: Contact BPS for API-related questions at [webapi.bps.go.id](https://webapi.bps.go.id)
- **🏛 Official BPS**: Visit [bps.go.id](https://www.bps.go.id) for official statistics

---

**Ready to build amazing statistical applications with Indonesian government data? Start exploring the comprehensive API documentation and build something great!** 🇮🇩📊
