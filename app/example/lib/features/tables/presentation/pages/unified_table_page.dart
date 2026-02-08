import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/tables/presentation/cubit/view_table_cubit.dart';
import 'package:stadata_example/features/tables/presentation/cubit/view_table_state.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// Unified table page implementing the all_stats pattern.
///
/// This page determines table type at runtime and routes to the appropriate
/// display implementation. Follows the ViewTable pattern where:
/// 1. Load table metadata to determine type
/// 2. Route to Static/Dynamic/Simdasi page based on type
/// 3. Handle loading and error states during metadata fetch
@RoutePage()
class UnifiedTablePage extends StatelessWidget {
  const UnifiedTablePage({
    required this.tableId,
    required this.domain,
    this.language = DataLanguage.id,
    super.key,
  });

  final String tableId;
  final String domain;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<ViewTableCubit>();
        unawaited(
          cubit.loadTableMetadata(
            tableId: tableId,
            domain: domain,
            lang: language,
          ),
        );
        return cubit;
      },
      child: const UnifiedTableView(),
    );
  }
}

class UnifiedTableView extends StatelessWidget {
  const UnifiedTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewTableCubit, ViewTableState>(
      listener: (context, state) {
        // Navigate to appropriate page based on table type
        switch (state) {
          case ViewTableShowStatic():
            // Navigate to static table detail page
            unawaited(
              context.router.replace(
                StaticTableDetailRoute(
                  id: state.tableId,
                  domain: state.domain,
                  language: state.lang,
                ),
              ),
            );
          case ViewTableShowDynamic():
            // Navigate to dynamic table detail page with initial data
            // Shows table immediately with "Dynamic Table" button to customize
            // This follows the all_stats pattern: show first, customize later
            unawaited(
              context.router.replace(
                DynamicTableDetailRoute(
                  variableID: state.tableId,
                  domain: state.domain,
                  language: state.lang,
                ),
              ),
            );
          case ViewTableShowSimdasi():
            // Simdasi tables not yet implemented - show error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Simdasi tables are not yet supported in this app. '
                  'Table ID: ${state.tableId}',
                ),
                backgroundColor: Colors.orange,
              ),
            );
            unawaited(context.router.maybePop());
          case ViewTableInitial():
          case ViewTableLoading():
          case ViewTableError():
            // Handled by builder
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Loading Table...'),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, ViewTableState state) {
    return switch (state) {
      ViewTableInitial() || ViewTableLoading() => const LoadingWidget(
        message: 'Determining table type...',
      ),
      ViewTableError(:final message) => ErrorStateWidget(
        message: message,
        onRetry: () => context.read<ViewTableCubit>().reset(),
      ),
      ViewTableShowStatic() ||
      ViewTableShowDynamic() ||
      ViewTableShowSimdasi() =>
      // Navigation handled in listener
      const LoadingWidget(
        message: 'Navigating to table...',
      ),
    };
  }
}
