import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/features/static_tables/presentation/cubit/static_table_detail_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

@RoutePage()
class StaticTableDetailPage extends StatelessWidget {
  const StaticTableDetailPage({
    required this.id,
    required this.domain,
    required this.language,
    super.key,
  });

  final int id;
  final String domain;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<StaticTableDetailCubit>()
                ..loadDetail(id: id, domain: domain, lang: language),
      child: const StaticTableDetailView(),
    );
  }
}

class StaticTableDetailView extends StatefulWidget {
  const StaticTableDetailView({super.key});

  @override
  State<StaticTableDetailView> createState() => _StaticTableDetailViewState();
}

class _StaticTableDetailViewState extends State<StaticTableDetailView> {
  double _webViewHeight = 0;

  String _wrapHtmlContent(String htmlContent) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
  <style>
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;700&display=swap');

body {
  width: fit-content;
  margin: 0;
  padding: 8px;
  font-size: 10px;
}

table {
  font-family: 'Plus Jakarta Sans', sans-serif;
  border-collapse: collapse;
}

thead {
  background-color: #0077EF;
  color: #FFFFFF;
}

tbody td {
  border: 1px solid gray;
}

thead tr th:not(:first-child) {
  border-left: 1px solid white;
}

td, th {
  padding: 8px;
}

tr > td:not(:first-child) {
  text-align: right;
}

.text-right {
  text-align: right;
}

.text-center {
  text-align: center;
}
  </style>
</head>
<body>
  <div class="htmlWrapper_container" id="_flutter_target_do_not_delete">$htmlContent</div>
  <script>
    function outputsize() {
      console.log(document.getElementById("_flutter_target_do_not_delete").offsetHeight);
      window.postMessage('flutterTargetHeight', document.getElementById("_flutter_target_do_not_delete").offsetHeight);
    }
    new ResizeObserver(outputsize).observe(_flutter_target_do_not_delete);
    outputsize();
  </script>
</body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaticTableDetailCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<StaticTableDetailCubit>();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Static Table Detail'),
            actions: [
              // Fullscreen button
              if (state is LoadedState<StaticTable> &&
                  state.data.table != null &&
                  state.data.table!.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.fullscreen),
                  tooltip: 'Fullscreen',
                  onPressed:
                      () => _openFullscreen(
                        context,
                        state.data.table!,
                        state.data.title,
                      ),
                ),
              // Download Excel button in app bar
              if (state is LoadedState<StaticTable>)
                IconButton(
                  icon: const Icon(Icons.download),
                  tooltip: 'Download Excel',
                  onPressed: () => _launchExcelUrl(context, state.data.excel),
                ),
              // Alice inspector button
              const AliceButton(),
              // Refresh button
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: () {
                  if (state is LoadedState<StaticTable>) {
                    final table = state.data;
                    cubit.refresh(
                      id: table.id,
                      domain:
                          context.router.current.queryParams
                              .get('domain')
                              .toString(),
                      lang:
                          context.router.current.queryParams
                                      .get('language')
                                      .toString() ==
                                  'en'
                              ? DataLanguage.en
                              : DataLanguage.id,
                    );
                  }
                },
              ),
            ],
          ),
          body: _buildBody(context, state, cubit),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    BaseState state,
    StaticTableDetailCubit cubit,
  ) {
    return switch (state) {
      LoadingState() => const LoadingWidget(),
      LoadedState<StaticTable>() => _buildContent(context, state.data),
      ErrorState() => ErrorStateWidget(
        message: state.message,
        onRetry: () {
          // Cannot retry without the parameters, show error message
        },
      ),
      _ => const Center(child: Text('No data available')),
    };
  }

  Widget _buildContent(BuildContext context, StaticTable table) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Table info header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            border: Border(
              bottom: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                table.title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Gap(AppSizes.spaceSm),
              if (table.subject != null) ...[
                Row(
                  children: [
                    Icon(
                      Icons.topic,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppSizes.spaceXs / 2),
                    Expanded(
                      child: Text(
                        'Subject: ${table.subject}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(AppSizes.spaceXs),
              ],
              Row(
                children: [
                  Icon(
                    Icons.update,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs / 2),
                  Text(
                    'Updated: ${_formatDate(table.updatedAt)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Gap(AppSizes.spaceSm),
                  Icon(
                    Icons.insert_drive_file,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs / 2),
                  Text(
                    'Size: ${table.size}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // HTML table content rendered in WebView
        if (table.table != null && table.table!.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: _webViewHeight == 0 ? 50 : _webViewHeight,
                child: InAppWebView(
                  initialData: InAppWebViewInitialData(
                    data: _wrapHtmlContent(table.table!),
                  ),
                  initialSettings: InAppWebViewSettings(
                    supportZoom: false,
                    javaScriptEnabled: true,
                    disableHorizontalScroll: false,
                    disableVerticalScroll: true,
                  ),
                  onConsoleMessage: (controller, consoleMessage) {
                    final height = double.tryParse(consoleMessage.message);
                    if (height != null && height > 0) {
                      setState(() {
                        _webViewHeight = height;
                      });
                    }
                  },
                ),
              ),
            ),
          )
        else
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.table_chart_outlined,
                      size: 64,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppSizes.spaceMd),
                    Text(
                      'No table data available',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Gap(AppSizes.spaceSm),
                    ElevatedButton.icon(
                      onPressed: () => _launchExcelUrl(context, table.excel),
                      icon: const Icon(Icons.download),
                      label: const Text('Download Excel'),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  void _openFullscreen(BuildContext context, String htmlContent, String title) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder:
            (context) =>
                _FullscreenTableView(htmlContent: htmlContent, title: title),
      ),
    );
  }

  Future<void> _launchExcelUrl(BuildContext context, String excelUrl) async {
    final url = Uri.parse(excelUrl);

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Cannot open URL'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      }
    } on Exception catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Download failed'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}

class _FullscreenTableView extends StatefulWidget {
  const _FullscreenTableView({required this.htmlContent, required this.title});

  final String htmlContent;
  final String title;

  @override
  State<_FullscreenTableView> createState() => _FullscreenTableViewState();
}

class _FullscreenTableViewState extends State<_FullscreenTableView> {
  String _wrapHtmlContent(String htmlContent) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=0.5, maximum-scale=5.0, user-scalable=yes">
  <style>
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;700&display=swap');

body {
  width: fit-content;
  margin: 0;
  padding: 8px;
  font-size: 10px;
}

table {
  font-family: 'Plus Jakarta Sans', sans-serif;
  border-collapse: collapse;
}

thead {
  background-color: #0077EF;
  color: #FFFFFF;
}

tbody td {
  border: 1px solid gray;
}

thead tr th:not(:first-child) {
  border-left: 1px solid white;
}

td, th {
  padding: 8px;
}

tr > td:not(:first-child) {
  text-align: right;
}

.text-right {
  text-align: right;
}

.text-center {
  text-align: center;
}
  </style>
</head>
<body>
  $htmlContent
</body>
</html>
''';
  }

  @override
  void initState() {
    super.initState();

    // Force landscape orientation for fullscreen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // Restore all orientations when leaving fullscreen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialData: InAppWebViewInitialData(
              data: _wrapHtmlContent(widget.htmlContent),
            ),
            initialSettings: InAppWebViewSettings(
              supportZoom: true,
              javaScriptEnabled: true,
              disableHorizontalScroll: false,
              disableVerticalScroll: false,
            ),
          ),
          // Floating close button in top-right corner
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.black54,
                  shape: const CircleBorder(),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    tooltip: 'Close',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
