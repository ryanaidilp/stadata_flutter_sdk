import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/features/tables/presentation/pages/unified_table_page.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// Demo page showcasing the unified table navigation pattern.
///
/// This page demonstrates how the unified table pattern automatically
/// detects table type and routes to appropriate pages.
@RoutePage()
class UnifiedTablesDemoPage extends StatelessWidget {
  const UnifiedTablesDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unified Tables Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                      const Gap(AppSizes.spaceXs),
                      Text(
                        'Unified Table Pattern',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                  const Gap(AppSizes.spaceSm),
                  Text(
                    'This pattern automatically detects if a table is '
                    'static or dynamic and routes to the appropriate page. '
                    'No need to know the table type beforehand!',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),

            const Gap(AppSizes.spaceLg),

            Text(
              'Example Tables',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(AppSizes.spaceSm),
            Text(
              'Tap any table below to see automatic routing in action:',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),

            const Gap(AppSizes.spaceMd),

            // Static Table Examples
            _buildSectionHeader(
              context,
              icon: Icons.table_chart,
              title: 'Static Tables',
              subtitle: 'Pre-rendered tables with fixed data',
              color: Colors.brown,
            ),
            const Gap(AppSizes.spaceSm),

            const _TableDemoCard(
              title: 'Indeks Harga Konsumen',
              tableId: '123',
              // Static table ID example
              domain: '0000',
              language: DataLanguage.id,
              tableType: 'Static',
              description: 'Will navigate to static table detail page',
              icon: Icons.analytics,
              color: Colors.brown,
            ),

            const Gap(AppSizes.spaceMd),

            // Dynamic Table Examples
            _buildSectionHeader(
              context,
              icon: Icons.table_view,
              title: 'Dynamic Tables',
              subtitle: 'Tables with customizable parameters',
              color: Colors.lightGreen,
            ),
            const Gap(AppSizes.spaceSm),

            const _TableDemoCard(
              title: 'Produk Domestik Bruto',
              tableId: '456',
              // Dynamic table ID example
              domain: '0000',
              language: DataLanguage.id,
              tableType: 'Dynamic',
              description: 'Will navigate to parameter selection page',
              icon: Icons.insights,
              color: Colors.lightGreen,
            ),

            const Gap(AppSizes.spaceLg),

            // How It Works
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.3),
                ),
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How It Works',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(AppSizes.spaceSm),
                  _buildStep('1', 'Fetch table metadata from API'),
                  _buildStep('2', 'Determine table type (static/dynamic)'),
                  _buildStep(
                    '3',
                    'Route to appropriate page automatically',
                  ),
                  _buildStep('4', 'User sees the correct table view'),
                ],
              ),
            ),

            const Gap(AppSizes.spaceXl),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSizes.spaceXs),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const Gap(AppSizes.spaceSm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStep(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}

class _TableDemoCard extends StatelessWidget {
  const _TableDemoCard({
    required this.title,
    required this.tableId,
    required this.domain,
    required this.language,
    required this.tableType,
    required this.description,
    required this.icon,
    required this.color,
  });

  final String title;
  final String tableId;
  final String domain;
  final DataLanguage language;
  final String tableType;
  final String description;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        side: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to unified table page
          unawaited(
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder:
                    (_) => UnifiedTablePage(
                      tableId: tableId,
                      domain: domain,
                      language: language,
                    ),
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.spaceSm),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const Gap(AppSizes.spaceMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(AppSizes.spaceXs),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.spaceXs,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(
                              AppSizes.radiusXs,
                            ),
                          ),
                          child: Text(
                            tableType,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Gap(AppSizes.spaceXs),
                        Text(
                          '•',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const Gap(AppSizes.spaceXs),
                        Expanded(
                          child: Text(
                            description,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
