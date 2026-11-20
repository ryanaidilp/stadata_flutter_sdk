# Press Release

The View Press Release API provides comprehensive access to detailed press release information from BPS (Badan Pusat Statistik) Indonesia. This method enables applications to retrieve complete press release content, including abstracts, PDF documents, presentation slides, cover images, and publication metadata for communication analysis, media management, and information dissemination purposes.

Press releases from BPS serve as official communication channels for statistical announcements, policy statements, data releases, and institutional updates. The View Press Release API ensures access to complete press release materials with supporting documents, enabling applications to provide users with comprehensive official communications and multimedia resources.

## Understanding the BPS Press Release System

BPS press releases provide official communication and media engagement:

- **Official Announcements**: Primary channel for formal statistical releases, policy announcements, and institutional communications
- **Multi-format Resources**: Complete document packages including PDFs, presentation slides, and cover materials
- **Subject Classification**: Organized by statistical subjects and thematic areas for targeted communication
- **Multimedia Support**: Rich content with visual materials, charts, and supporting documentation
- **Temporal Coordination**: Strategic release timing aligned with statistical cycles and important events

## Press Release Categories

### Statistical Data Announcements
- **Economic Releases**: GDP announcements, inflation reports, trade statistics, and macroeconomic indicators
- **Social Statistics**: Population updates, education statistics, health indicators, and welfare reports
- **Demographic Releases**: Census results, population projections, and demographic analysis
- **Regional Statistics**: Province-specific releases and comparative regional analysis

### Policy and Institutional Communications
- **Methodology Updates**: New statistical methods, data collection techniques, and quality improvements
- **International Cooperation**: Partnership announcements, technical assistance programs, and global initiatives
- **Institutional Development**: Organizational updates, strategic planning, and capacity building initiatives
- **Technology Advancement**: Digital transformation updates, system improvements, and innovation announcements

### Event and Program Communications
- **Conference Announcements**: Statistical conferences, workshops, and professional development events
- **Training Programs**: Capacity building initiatives, educational programs, and skill development
- **Public Engagement**: Community outreach, stakeholder consultations, and transparency initiatives
- **Recognition and Awards**: Achievement announcements, awards, and milestone celebrations

## Parameters

| Parameter | Type           | Description                                                       |
| --------- | -------------- | ----------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the specific press release |
| `domain`  | `String`       | **Required**: The domain (region) code specifying administrative context |
| `lang`    | `DataLanguage` | **Optional**: Language preference for localized content (default: `DataLanguage.id`) |

## Examples

### 1. Basic Press Release Retrieval

![Preview](/gif/press_releases.gif)

```dart
// Retrieve detailed information for a specific press release
final pressRelease = await StadataFlutter.instance.view.pressRelease(
  id: 1234, // Example: Economic statistics press release ID
  domain: '0000', // National level
  lang: DataLanguage.id,
);

if (pressRelease != null) {
  print('=== Press Release Details ===');
  print('Release ID: ${pressRelease.id}');
  print('Title: ${pressRelease.title}');
  print('Subject: ${pressRelease.subject?.name ?? 'General'}');
  
  // Publication information
  print('\n=== Publication Information ===');
  print('Release Date: ${pressRelease.releaseDate ?? 'Date not specified'}');
  print('Last Updated: ${pressRelease.updatedAt}');
  print('File Size: ${pressRelease.size}');
  
  // Content and resources
  print('\n=== Available Resources ===');
  print('PDF Available: ${pressRelease.pdf.isNotEmpty ? 'Yes' : 'No'}');
  print('Slides Available: ${pressRelease.slide.isNotEmpty ? 'Yes' : 'No'}');
  print('Cover Image Available: ${pressRelease.cover.isNotEmpty ? 'Yes' : 'No'}');
  
  if (pressRelease.pdf.isNotEmpty) {
    print('PDF URL: ${pressRelease.pdf}');
  }
  if (pressRelease.slide.isNotEmpty) {
    print('Slides URL: ${pressRelease.slide}');
  }
  if (pressRelease.cover.isNotEmpty) {
    print('Cover URL: ${pressRelease.cover}');
  }
  
  // Abstract content
  if (pressRelease.abstract != null && pressRelease.abstract!.isNotEmpty) {
    print('\n=== Abstract ===');
    final abstractPreview = pressRelease.abstract!.length > 300 
        ? '${pressRelease.abstract!.substring(0, 300)}...'
        : pressRelease.abstract!;
    print('Content: $abstractPreview');
    print('Abstract Length: ${pressRelease.abstract!.length} characters');
  } else {
    print('\n=== Abstract ===');
    print('No abstract available');
  }
  
  // Resource analysis
  print('\n=== Resource Analysis ===');
  final resourceCount = [
    pressRelease.pdf.isNotEmpty,
    pressRelease.slide.isNotEmpty,
    pressRelease.cover.isNotEmpty,
  ].where((available) => available).length;
  
  print('Available Resources: $resourceCount/3 formats');
  
  if (resourceCount >= 3) {
    print('Status: Complete media package');
  } else if (resourceCount >= 2) {
    print('Status: Partial media package');
  } else {
    print('Status: Basic documentation');
  }
  
} else {
  print('Press release not found or not accessible');
}
```

### 2. Press Release Communication Analysis

```dart
// Comprehensive press release communication analysis
class PressReleaseCommunicationAnalyzer {
  static Future<void> analyzePressReleaseCommunication(
    String domain,
    String analysisTheme,
  ) async {
    try {
      // 1. Discover press releases using List API
      final pressReleasesList = await StadataFlutter.instance.list.pressReleases(
        domain: domain,
        keyword: analysisTheme,
        lang: DataLanguage.id,
      );
      
      print('=== Press Release Communication Analysis: "$analysisTheme" ===');
      print('Found ${pressReleasesList.data.length} press releases');
      
      if (pressReleasesList.data.isEmpty) {
        print('No press releases found for theme: $analysisTheme');
        return;
      }
      
      // 2. Analyze each press release in detail
      final communicationAnalysis = <Map<String, dynamic>>[];
      
      for (final prSummary in pressReleasesList.data.take(10)) {
        print('\n--- Analyzing: ${prSummary.title} ---');
        
        final detailedPR = await StadataFlutter.instance.view.pressRelease(
          id: prSummary.id,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (detailedPR != null) {
          final analysis = _analyzePressReleaseContent(detailedPR);
          communicationAnalysis.add({
            'id': detailedPR.id,
            'title': detailedPR.title,
            'subject': detailedPR.subject?.name,
            'releaseDate': detailedPR.releaseDate,
            'updatedAt': detailedPR.updatedAt,
            'hasAbstract': detailedPR.abstract != null && detailedPR.abstract!.isNotEmpty,
            'hasPdf': detailedPR.pdf.isNotEmpty,
            'hasSlides': detailedPR.slide.isNotEmpty,
            'hasCover': detailedPR.cover.isNotEmpty,
            'fileSize': detailedPR.size,
            'analysis': analysis,
          });
          
          // Display key findings
          print('Subject: ${detailedPR.subject?.name ?? 'Unclassified'}');
          print('Release Date: ${detailedPR.releaseDate ?? 'Not specified'}');
          print('File Size: ${detailedPR.size}');
          print('Resources: PDF(${detailedPR.pdf.isNotEmpty ? '✓' : '✗'}) Slides(${detailedPR.slide.isNotEmpty ? '✓' : '✗'}) Cover(${detailedPR.cover.isNotEmpty ? '✓' : '✗'})');
          print('Communication Type: ${analysis['communicationType']}');
          print('Target Audience: ${analysis['targetAudience']}');
          
          if (analysis['keyTopics'].isNotEmpty) {
            print('Key Topics: ${analysis['keyTopics'].join(', ')}');
          }
          
        } else {
          print('Failed to retrieve detailed information');
        }
        
        // Rate limiting
        await Future.delayed(Duration(milliseconds: 400));
      }
      
      // 3. Communication analysis summary
      print('\n=== Communication Analysis Summary ===');
      print('Total Press Releases Analyzed: ${communicationAnalysis.length}');
      
      // Resource completeness analysis
      final withPdf = communicationAnalysis.where((pr) => pr['hasPdf']).length;
      final withSlides = communicationAnalysis.where((pr) => pr['hasSlides']).length;
      final withCover = communicationAnalysis.where((pr) => pr['hasCover']).length;
      final withAbstract = communicationAnalysis.where((pr) => pr['hasAbstract']).length;
      
      print('\nResource Availability:');
      print('PDF Documents: $withPdf/${communicationAnalysis.length}');
      print('Presentation Slides: $withSlides/${communicationAnalysis.length}');
      print('Cover Images: $withCover/${communicationAnalysis.length}');
      print('Abstracts: $withAbstract/${communicationAnalysis.length}');
      
      // Subject distribution
      final subjectDistribution = <String?, int>{};
      for (final pr in communicationAnalysis) {
        final subject = pr['subject'] as String?;
        subjectDistribution[subject] = (subjectDistribution[subject] ?? 0) + 1;
      }
      
      print('\nSubject Distribution:');
      final sortedSubjects = subjectDistribution.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedSubjects.take(5)) {
        final subject = entry.key ?? 'Unclassified';
        print('  $subject: ${entry.value} releases');
      }
      
      // Communication type analysis
      final communicationTypes = <String, int>{};
      for (final pr in communicationAnalysis) {
        final type = pr['analysis']['communicationType'] as String;
        communicationTypes[type] = (communicationTypes[type] ?? 0) + 1;
      }
      
      print('\nCommunication Types:');
      for (final entry in communicationTypes.entries) {
        final percentage = (entry.value / communicationAnalysis.length * 100).toStringAsFixed(1);
        print('  ${entry.key}: ${entry.value} releases (${percentage}%)');
      }
      
      // Quality assessment
      final avgResourceCount = communicationAnalysis.map((pr) => [
        pr['hasPdf'] ? 1 : 0,
        pr['hasSlides'] ? 1 : 0,
        pr['hasCover'] ? 1 : 0,
        pr['hasAbstract'] ? 1 : 0,
      ].reduce((a, b) => a + b)).reduce((a, b) => a + b) / communicationAnalysis.length;
      
      print('\nQuality Metrics:');
      print('Average Resources per Release: ${avgResourceCount.toStringAsFixed(1)}/4');
      
      final completeReleases = communicationAnalysis.where((pr) => 
          pr['hasPdf'] && pr['hasSlides'] && pr['hasCover'] && pr['hasAbstract']
      ).length;
      
      print('Complete Releases (all resources): $completeReleases/${communicationAnalysis.length}');
      
      // Temporal analysis
      final currentDate = DateTime.now();
      final recentReleases = communicationAnalysis.where((pr) => 
          pr['releaseDate'] != null && 
          (pr['releaseDate'] as DateTime).isAfter(currentDate.subtract(Duration(days: 90)))
      ).length;
      
      print('\nTemporal Analysis:');
      print('Recent Releases (last 90 days): $recentReleases');
      
    } catch (e) {
      print('Communication analysis error: $e');
    }
  }
  
  static Map<String, dynamic> _analyzePressReleaseContent(PressRelease pressRelease) {
    final analysis = <String, dynamic>{};
    
    // Determine communication type based on content and resources
    String communicationType = 'Standard';
    
    if (pressRelease.slide.isNotEmpty && pressRelease.pdf.isNotEmpty) {
      communicationType = 'Comprehensive';
    } else if (pressRelease.slide.isNotEmpty) {
      communicationType = 'Presentation-focused';
    } else if (pressRelease.pdf.isNotEmpty) {
      communicationType = 'Document-focused';
    } else {
      communicationType = 'Basic';
    }
    
    analysis['communicationType'] = communicationType;
    
    // Determine target audience based on title and subject
    final title = pressRelease.title.toLowerCase();
    final subject = pressRelease.subject?.name?.toLowerCase() ?? '';
    
    String targetAudience = 'General Public';
    
    if (title.contains('metodologi') || title.contains('teknis')) {
      targetAudience = 'Technical Audience';
    } else if (title.contains('kerjasama') || title.contains('internasional')) {
      targetAudience = 'International Partners';
    } else if (title.contains('pelatihan') || title.contains('workshop')) {
      targetAudience = 'Professional Development';
    } else if (subject.contains('ekonomi') || subject.contains('statistik')) {
      targetAudience = 'Stakeholders & Media';
    }
    
    analysis['targetAudience'] = targetAudience;
    
    // Extract key topics from title and abstract
    final keyTopics = <String>[];
    final content = '${title} ${pressRelease.abstract ?? ''}'.toLowerCase();
    
    if (content.contains('inflasi') || content.contains('harga')) keyTopics.add('Inflation');
    if (content.contains('pdb') || content.contains('ekonomi')) keyTopics.add('Economic Growth');
    if (content.contains('penduduk') || content.contains('sensus')) keyTopics.add('Population');
    if (content.contains('perdagangan') || content.contains('ekspor')) keyTopics.add('Trade');
    if (content.contains('teknologi') || content.contains('digital')) keyTopics.add('Technology');
    if (content.contains('kerjasama') || content.contains('mou')) keyTopics.add('Cooperation');
    if (content.contains('pelatihan') || content.contains('capacity')) keyTopics.add('Training');
    if (content.contains('metodologi') || content.contains('survei')) keyTopics.add('Methodology');
    
    analysis['keyTopics'] = keyTopics.isNotEmpty ? keyTopics : ['General'];
    
    return analysis;
  }
}
```

### 3. Press Release Media Package Management

```dart
// Comprehensive media package management for press releases
class PressReleaseMediaManager {
  static Future<void> managePressReleaseMediaPackages(
    List<int> pressReleaseIds,
    String domain,
  ) async {
    try {
      print('=== Press Release Media Package Management ===');
      print('Managing ${pressReleaseIds.length} press releases...');
      
      final mediaPackages = <Map<String, dynamic>>[];
      final downloadUrls = <String, List<String>>{};
      
      // 1. Retrieve all press releases
      for (final prId in pressReleaseIds) {
        final pressRelease = await StadataFlutter.instance.view.pressRelease(
          id: prId,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (pressRelease != null) {
          final packageData = {
            'id': pressRelease.id,
            'title': pressRelease.title,
            'subject': pressRelease.subject?.name,
            'releaseDate': pressRelease.releaseDate?.toIso8601String(),
            'updatedAt': pressRelease.updatedAt.toIso8601String(),
            'fileSize': pressRelease.size,
            'abstract': pressRelease.abstract,
            'resources': <String, dynamic>{},
          };
          
          // Catalog available resources
          final resources = <String, dynamic>{};
          final urls = <String>[];
          
          if (pressRelease.pdf.isNotEmpty) {
            resources['pdf'] = {
              'available': true,
              'url': pressRelease.pdf,
              'type': 'Document',
            };
            urls.add(pressRelease.pdf);
          }
          
          if (pressRelease.slide.isNotEmpty) {
            resources['slides'] = {
              'available': true,
              'url': pressRelease.slide,
              'type': 'Presentation',
            };
            urls.add(pressRelease.slide);
          }
          
          if (pressRelease.cover.isNotEmpty) {
            resources['cover'] = {
              'available': true,
              'url': pressRelease.cover,
              'type': 'Image',
            };
            urls.add(pressRelease.cover);
          }
          
          packageData['resources'] = resources;
          packageData['resourceCount'] = resources.length;
          packageData['completeness'] = _calculatePackageCompleteness(resources);
          
          mediaPackages.add(packageData);
          
          if (urls.isNotEmpty) {
            downloadUrls[pressRelease.title] = urls;
          }
          
          print('  ✓ Processed: ${pressRelease.title}');
          print('    Resources: ${resources.length}/3 available');
          
        } else {
          print('  ✗ Failed to load press release: $prId');
        }
        
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // 2. Generate package management report
      print('\n=== Media Package Report ===');
      print('Successfully processed: ${mediaPackages.length} packages');
      print('Download URLs cataloged: ${downloadUrls.length}');
      
      // Completeness analysis
      final completePackages = mediaPackages.where((pkg) => pkg['completeness'] == 1.0).length;
      final partialPackages = mediaPackages.where((pkg) => 
          pkg['completeness'] > 0.5 && pkg['completeness'] < 1.0).length;
      final basicPackages = mediaPackages.where((pkg) => pkg['completeness'] <= 0.5).length;
      
      print('\nPackage Completeness:');
      print('  Complete (3/3 resources): $completePackages');
      print('  Partial (2/3 resources): $partialPackages');
      print('  Basic (≤1/3 resources): $basicPackages');
      
      // Resource type analysis
      final resourceTypes = <String, int>{
        'pdf': 0,
        'slides': 0,
        'cover': 0,
      };
      
      for (final package in mediaPackages) {
        final resources = package['resources'] as Map<String, dynamic>;
        for (final type in resourceTypes.keys) {
          if (resources.containsKey(type)) {
            resourceTypes[type] = resourceTypes[type]! + 1;
          }
        }
      }
      
      print('\nResource Type Availability:');
      for (final entry in resourceTypes.entries) {
        final percentage = (entry.value / mediaPackages.length * 100).toStringAsFixed(1);
        print('  ${entry.key.toUpperCase()}: ${entry.value}/${mediaPackages.length} (${percentage}%)');
      }
      
      // Subject distribution
      final subjectPackages = <String?, int>{};
      for (final package in mediaPackages) {
        final subject = package['subject'] as String?;
        subjectPackages[subject] = (subjectPackages[subject] ?? 0) + 1;
      }
      
      print('\nPackages by Subject:');
      final sortedSubjects = subjectPackages.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedSubjects.take(5)) {
        final subject = entry.key ?? 'Unclassified';
        print('  $subject: ${entry.value} packages');
      }
      
      // 3. Generate download manifest
      print('\n=== Download Manifest ===');
      if (downloadUrls.isNotEmpty) {
        print('Media packages ready for download: ${downloadUrls.length}');
        print('Total URLs: ${downloadUrls.values.fold(0, (sum, urls) => sum + urls.length)}');
        
        // Categorize by resource type
        final urlsByType = <String, int>{
          'PDF': 0,
          'Slides': 0,
          'Images': 0,
        };
        
        for (final urls in downloadUrls.values) {
          for (final url in urls) {
            if (url.toLowerCase().contains('.pdf')) {
              urlsByType['PDF'] = urlsByType['PDF']! + 1;
            } else if (url.toLowerCase().contains('slide') || url.toLowerCase().contains('.ppt')) {
              urlsByType['Slides'] = urlsByType['Slides']! + 1;
            } else {
              urlsByType['Images'] = urlsByType['Images']! + 1;
            }
          }
        }
        
        print('URLs by type:');
        for (final entry in urlsByType.entries) {
          print('  ${entry.key}: ${entry.value} files');
        }
      }
      
      // 4. Quality recommendations
      print('\n=== Quality Recommendations ===');
      
      final avgCompleteness = mediaPackages.isNotEmpty
          ? mediaPackages.map((pkg) => pkg['completeness'] as double).reduce((a, b) => a + b) / mediaPackages.length
          : 0.0;
      
      print('Average package completeness: ${(avgCompleteness * 100).toStringAsFixed(1)}%');
      
      if (avgCompleteness >= 0.8) {
        print('✅ Excellent media package quality - maintain current standards');
      } else if (avgCompleteness >= 0.6) {
        print('⚠️ Good quality - consider improving resource completeness');
      } else {
        print('🔧 Quality improvement needed - focus on complete media packages');
      }
      
      if (resourceTypes['cover']! < mediaPackages.length * 0.7) {
        print('📸 Recommendation: Increase cover image availability for better visual engagement');
      }
      
      if (resourceTypes['slides']! < mediaPackages.length * 0.5) {
        print('📊 Recommendation: Develop more presentation materials for enhanced communication');
      }
      
    } catch (e) {
      print('Media package management error: $e');
    }
  }
  
  static double _calculatePackageCompleteness(Map<String, dynamic> resources) {
    const maxResources = 3; // pdf, slides, cover
    return resources.length / maxResources;
  }
}
```

### 4. Press Release Communication Strategy Analysis

```dart
// Strategic analysis of press release communication effectiveness
class PressReleaseCommunicationStrategy {
  static Future<void> analyzeCommunicationStrategy(
    String domain,
    {int analysisMonths = 12}
  ) async {
    try {
      print('=== Press Release Communication Strategy Analysis ===');
      print('Analyzing $analysisMonths months of press releases for domain: $domain');
      
      // 1. Get comprehensive press release data
      final allPressReleases = await StadataFlutter.instance.list.pressReleases(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      if (allPressReleases.data.isEmpty) {
        print('No press releases found for analysis');
        return;
      }
      
      // 2. Analyze detailed press releases
      final strategyAnalysis = <Map<String, dynamic>>[];
      final cutoffDate = DateTime.now().subtract(Duration(days: analysisMonths * 30));
      
      for (final prSummary in allPressReleases.data.take(20)) {
        final detailedPR = await StadataFlutter.instance.view.pressRelease(
          id: prSummary.id,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (detailedPR != null && 
            (detailedPR.releaseDate?.isAfter(cutoffDate) ?? false)) {
          
          final strategicAnalysis = _analyzeStrategicElements(detailedPR);
          strategyAnalysis.add({
            'id': detailedPR.id,
            'title': detailedPR.title,
            'subject': detailedPR.subject?.name,
            'releaseDate': detailedPR.releaseDate,
            'strategic': strategicAnalysis,
          });
          
          print('  ✓ Analyzed: ${detailedPR.title}');
        }
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      if (strategyAnalysis.isEmpty) {
        print('No recent press releases found for strategic analysis');
        return;
      }
      
      // 3. Strategic communication analysis
      print('\n=== Strategic Communication Analysis ===');
      print('Press releases analyzed: ${strategyAnalysis.length}');
      
      // Communication timing analysis
      final monthlyDistribution = <int, int>{};
      final dayOfWeekDistribution = <int, int>{};
      
      for (final pr in strategyAnalysis) {
        final releaseDate = pr['releaseDate'] as DateTime;
        final month = releaseDate.month;
        final dayOfWeek = releaseDate.weekday;
        
        monthlyDistribution[month] = (monthlyDistribution[month] ?? 0) + 1;
        dayOfWeekDistribution[dayOfWeek] = (dayOfWeekDistribution[dayOfWeek] ?? 0) + 1;
      }
      
      print('\nTiming Strategy:');
      print('Most active months:');
      final sortedMonths = monthlyDistribution.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      final monthNames = [
        '', 'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      
      for (final entry in sortedMonths.take(3)) {
        print('  ${monthNames[entry.key]}: ${entry.value} releases');
      }
      
      print('Most active days:');
      final dayNames = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
      final sortedDays = dayOfWeekDistribution.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedDays.take(3)) {
        print('  ${dayNames[entry.key]}: ${entry.value} releases');
      }
      
      // Strategic priority analysis
      final priorityDistribution = <String, int>{};
      final impactDistribution = <String, int>{};
      
      for (final pr in strategyAnalysis) {
        final strategic = pr['strategic'] as Map<String, dynamic>;
        final priority = strategic['priority'] as String;
        final impact = strategic['impact'] as String;
        
        priorityDistribution[priority] = (priorityDistribution[priority] ?? 0) + 1;
        impactDistribution[impact] = (impactDistribution[impact] ?? 0) + 1;
      }
      
      print('\nStrategic Priority Distribution:');
      for (final entry in priorityDistribution.entries) {
        final percentage = (entry.value / strategyAnalysis.length * 100).toStringAsFixed(1);
        print('  ${entry.key}: ${entry.value} releases (${percentage}%)');
      }
      
      print('\nCommunication Impact Distribution:');
      for (final entry in impactDistribution.entries) {
        final percentage = (entry.value / strategyAnalysis.length * 100).toStringAsFixed(1);
        print('  ${entry.key}: ${entry.value} releases (${percentage}%)');
      }
      
      // Subject strategy analysis
      final subjectStrategy = <String?, Map<String, int>>{};
      for (final pr in strategyAnalysis) {
        final subject = pr['subject'] as String?;
        final strategic = pr['strategic'] as Map<String, dynamic>;
        final priority = strategic['priority'] as String;
        
        subjectStrategy[subject] = subjectStrategy[subject] ?? <String, int>{};
        subjectStrategy[subject]![priority] = (subjectStrategy[subject]![priority] ?? 0) + 1;
      }
      
      print('\nSubject Communication Strategy:');
      for (final entry in subjectStrategy.entries) {
        final subject = entry.key ?? 'Unclassified';
        final strategies = entry.value;
        final total = strategies.values.reduce((a, b) => a + b);
        
        print('$subject ($total releases):');
        for (final strategyEntry in strategies.entries) {
          print('  ${strategyEntry.key}: ${strategyEntry.value}');
        }
      }
      
      // 4. Strategic recommendations
      print('\n=== Strategic Recommendations ===');
      
      // Timing recommendations
      final weekdayReleases = dayOfWeekDistribution.entries
          .where((entry) => entry.key >= 1 && entry.key <= 5)
          .map((entry) => entry.value)
          .fold(0, (a, b) => a + b);
      
      final weekendReleases = strategyAnalysis.length - weekdayReleases;
      
      if (weekendReleases > strategyAnalysis.length * 0.2) {
        print('📅 Consider reducing weekend releases for better media engagement');
      }
      
      // Priority balance recommendations
      final highPriority = priorityDistribution['High'] ?? 0;
      if (highPriority > strategyAnalysis.length * 0.4) {
        print('⚖️ Consider better priority balance - too many high-priority releases may dilute impact');
      }
      
      // Resource completeness recommendations
      final strategicReleases = strategyAnalysis.where((pr) => 
          (pr['strategic'] as Map<String, dynamic>)['priority'] == 'High').length;
      
      print('📊 Strategic Communication Health:');
      print('  High-priority releases: ${(highPriority / strategyAnalysis.length * 100).toStringAsFixed(1)}%');
      print('  Weekday optimization: ${(weekdayReleases / strategyAnalysis.length * 100).toStringAsFixed(1)}%');
      
      if (highPriority >= strategyAnalysis.length * 0.2 && weekdayReleases >= strategyAnalysis.length * 0.7) {
        print('✅ Communication strategy is well-balanced');
      } else {
        print('🔧 Communication strategy needs optimization');
      }
      
    } catch (e) {
      print('Communication strategy analysis error: $e');
    }
  }
  
  static Map<String, dynamic> _analyzeStrategicElements(PressRelease pressRelease) {
    final strategic = <String, dynamic>{};
    
    // Determine strategic priority
    final title = pressRelease.title.toLowerCase();
    final subject = pressRelease.subject?.name?.toLowerCase() ?? '';
    
    String priority = 'Medium';
    
    if (title.contains('penting') || title.contains('urgent') || title.contains('darurat')) {
      priority = 'Critical';
    } else if (title.contains('nasional') || title.contains('presiden') || title.contains('menteri')) {
      priority = 'High';
    } else if (subject.contains('ekonomi') || subject.contains('inflasi') || subject.contains('pdb')) {
      priority = 'High';
    } else if (title.contains('pelatihan') || title.contains('workshop') || title.contains('teknis')) {
      priority = 'Low';
    }
    
    strategic['priority'] = priority;
    
    // Determine communication impact
    String impact = 'Medium';
    
    final hasCompletePackage = pressRelease.pdf.isNotEmpty && 
                               pressRelease.slide.isNotEmpty && 
                               pressRelease.cover.isNotEmpty;
    
    if (hasCompletePackage && priority == 'High') {
      impact = 'High';
    } else if (hasCompletePackage || priority == 'High') {
      impact = 'Medium-High';
    } else if (pressRelease.pdf.isNotEmpty) {
      impact = 'Medium';
    } else {
      impact = 'Low';
    }
    
    strategic['impact'] = impact;
    
    // Determine audience reach
    String audienceReach = 'Targeted';
    
    if (title.contains('nasional') || title.contains('indonesia')) {
      audienceReach = 'National';
    } else if (title.contains('regional') || title.contains('provinsi')) {
      audienceReach = 'Regional';
    } else if (title.contains('internasional') || title.contains('global')) {
      audienceReach = 'International';
    }
    
    strategic['audienceReach'] = audienceReach;
    
    return strategic;
  }
}
```

## Press Release Workflow Integration

Typical workflow for working with press releases effectively:

1. **Discovery Phase**: Use List API to identify press releases of interest based on keywords, subjects, or time periods
2. **Detailed Retrieval**: Use View API to get complete press release content and media resources
3. **Resource Management**: Catalog and organize PDF documents, presentation slides, and cover images
4. **Communication Analysis**: Analyze press release strategy, timing, and effectiveness
5. **Media Package Planning**: Prepare comprehensive media packages for distribution and archival

### Integration with Other APIs

```dart
// Building comprehensive press release and communication workflow
Future<void> buildPressReleaseCommunicationWorkflow(String domain, String topic) async {
  try {
    // 1. Find related press releases
    final pressReleases = await StadataFlutter.instance.list.pressReleases(
      domain: domain,
      keyword: topic,
    );
    
    // 2. Find related news for context
    final news = await StadataFlutter.instance.list.news(
      domain: domain,
      keyword: topic,
    );
    
    // 3. Find related publications for supporting materials
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      keyword: topic,
    );
    
    // 4. Get detailed information for top press releases
    final detailedPressReleases = <PressRelease>[];
    for (final pr in pressReleases.data.take(3)) {
      final detailed = await StadataFlutter.instance.view.pressRelease(
        id: pr.id,
        domain: domain,
      );
      if (detailed != null) detailedPressReleases.add(detailed);
    }
    
    print('=== Press Release Communication Analysis: $topic ===');
    print('Press Releases: ${pressReleases.data.length}');
    print('Related News: ${news.data.length}');
    print('Supporting Publications: ${publications.data.length}');
    print('Detailed analysis: ${detailedPressReleases.length} releases');
    
    // Cross-reference analysis
    for (final pr in detailedPressReleases) {
      print('\nPress Release: ${pr.title}');
      print('Subject: ${pr.subject?.name ?? 'General'}');
      print('Release Date: ${pr.releaseDate ?? 'Not specified'}');
      print('Resources: PDF(${pr.pdf.isNotEmpty ? '✓' : '✗'}) Slides(${pr.slide.isNotEmpty ? '✓' : '✗'}) Cover(${pr.cover.isNotEmpty ? '✓' : '✗'})');
      
      // Find related content
      final relatedNews = news.data.where((n) => 
          n.title.toLowerCase().contains(topic.toLowerCase())
      ).take(2);
      
      final relatedPubs = publications.data.where((p) => 
          p.title.toLowerCase().contains(topic.toLowerCase())
      ).take(2);
      
      if (relatedNews.isNotEmpty) {
        print('Related News Coverage:');
        for (final newsItem in relatedNews) {
          print('  • ${newsItem.title}');
        }
      }
      
      if (relatedPubs.isNotEmpty) {
        print('Supporting Publications:');
        for (final pub in relatedPubs) {
          print('  • ${pub.title}');
        }
      }
    }
    
  } catch (e) {
    print('Press release communication workflow error: $e');
  }
}
```

## Error Handling

The View Press Release API returns nullable `PressRelease` objects and may throw specific exceptions:

- **PressReleaseException**: Press release-specific errors (invalid ID, domain restrictions, access permissions)
- **ApiException**: General API communication errors (network issues, server errors, rate limiting)
- **ApiKeyNotFoundException**: Authentication errors (invalid or missing API key)
- **ValidationException**: Parameter validation errors (invalid press release IDs, malformed domain codes)

```dart
try {
  final pressRelease = await StadataFlutter.instance.view.pressRelease(
    id: 1234,
    domain: '0000',
    lang: DataLanguage.id,
  );
  
  if (pressRelease != null) {
    // Successfully retrieved press release
    print('Press Release: ${pressRelease.title}');
    print('Subject: ${pressRelease.subject?.name ?? 'General'}');
    print('PDF Available: ${pressRelease.pdf.isNotEmpty}');
    print('Slides Available: ${pressRelease.slide.isNotEmpty}');
    print('Cover Available: ${pressRelease.cover.isNotEmpty}');
  } else {
    // Press release not found or not accessible
    print('Press release not found - may be unpublished or restricted');
  }
  
} on PressReleaseException catch (e) {
  print('Press release error: ${e.message}');
  // Handle press release-specific errors like invalid ID or access restrictions
  
} on ApiException catch (e) {
  print('API communication error: ${e.message}');
  // Handle network connectivity or server issues
  
} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');
  // Handle API key configuration issues
  
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unforeseen errors
}
```

## Performance Considerations

- **Rate Limiting**: Implement appropriate delays between requests, especially for media package management
- **Caching Strategy**: Cache press release content and media URLs for frequently accessed releases
- **Resource Management**: Consider file sizes when implementing download functionality for PDFs and slides
- **Media Processing**: Implement progressive loading for cover images and multimedia content
- **Batch Processing**: Process press releases in batches for analysis and management workflows
- **Storage Planning**: Plan adequate storage for downloaded media packages and archived content

## Properties (PressRelease)

| Property      | Type        | Description                                                             |
| ------------- | ----------- | ----------------------------------------------------------------------- |
| `id`          | `int`       | Unique numerical identifier for the press release                       |
| `title`       | `String`    | Complete title of the press release                                     |
| `subject`     | `Subject?`  | Statistical subject classification for the press release (optional)     |
| `size`        | `String`    | File size information in human-readable format                          |
| `pdf`         | `String`    | Direct URL to the PDF document of the press release                     |
| `cover`       | `String`    | URL to the cover image or thumbnail representation                      |
| `abstract`    | `String?`   | Summary or abstract of the press release content (optional)             |
| `updatedAt`   | `DateTime`  | Timestamp when the press release was last updated                       |
| `releaseDate` | `DateTime?` | Official release date and time of the press release (optional)          |
| `slide`       | `String`    | URL to the presentation slides associated with the press release        |