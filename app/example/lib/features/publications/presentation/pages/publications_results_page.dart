import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/publications/presentation/cubit/publications_results_cubit.dart';
import 'package:stadata_example/features/publications/presentation/widgets/publications_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class PublicationsResultsPage extends StatelessWidget {
  const PublicationsResultsPage({
    required this.domain,
    required this.language,
    this.keyword,
    this.month,
    this.year,
    super.key,
  });

  final String domain;
  final DataLanguage language;
  final String? keyword;
  final int? month;
  final int? year;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocProvider(
      create:
          (context) =>
              getIt<PublicationsResultsCubit>()..initialize(
                domain: domain,
                language: language,
                keyword: keyword,
                month: month,
                year: year,
              ),
      child: BlocBuilder<PublicationsResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<PublicationsResultsCubit>();

          // Auto-load data when widget is first built and in initial state
          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              unawaited(cubit.loadData());
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.publications.results.title),
              actions: [
                // Alice inspector button (debug only)
                const AliceButton(),
                IconButton(
                  onPressed: cubit.refresh,
                  icon: const Icon(Icons.refresh),
                  tooltip: t.common.refresh,
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: cubit.refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search parameters summary
                    _PublicationsParametersPanel(cubit: cubit),

                    const Gap(AppSizes.spaceLg),

                    // Main content based on state
                    _PublicationsMainContent(state: state, cubit: cubit),

                    // Pagination controls - only show when we have data
                    if (state is LoadedState<List<Publication>> &&
                        state.data.isNotEmpty &&
                        cubit.totalPages > 1) ...[
                      const Gap(AppSizes.spaceLg),
                      NumberPaginator(
                        key: ValueKey(cubit.currentPage),
                        numberPages: cubit.totalPages,
                        initialPage: cubit.currentPage - 1,
                        onPageChange: (index) {
                          unawaited(cubit.loadData(page: index + 1));
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PublicationsParametersPanel extends StatelessWidget {
  const _PublicationsParametersPanel({required this.cubit});

  final PublicationsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return ResultsParametersPanel(
      title: t.publications.results.searchParameters,
      headerBottomSpacing: AppSizes.spaceSm,
      chips: [
        ResultsParameterChip(
          icon: Icons.domain,
          text: '${t.publications.parameters.domain}: ${cubit.domain ?? '-'}',
        ),
        ResultsParameterChip(
          icon: Icons.language,
          text:
              '${t.publications.parameters.language}: ${cubit.currentLanguage == DataLanguage.id ? t.instructions.languageLabels.indonesian : t.instructions.languageLabels.english}',
        ),
        if (cubit.keyword != null)
          ResultsParameterChip(
            icon: Icons.search,
            text: '${t.publications.parameters.keyword}: ${cubit.keyword!}',
          ),
        if (cubit.month != null)
          ResultsParameterChip(
            icon: Icons.calendar_month,
            text:
                '${t.publications.parameters.month}: ${_getMonthName(cubit.month!)}',
          ),
        if (cubit.year != null)
          ResultsParameterChip(
            icon: Icons.calendar_today,
            text: '${t.publications.parameters.year}: ${cubit.year}',
          ),
      ],
    );
  }
}

class _PublicationsMainContent extends StatelessWidget {
  const _PublicationsMainContent({required this.state, required this.cubit});

  final BaseState state;
  final PublicationsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;
    final currentState = state;

    return switch (currentState) {
      LoadingState() => const LoadingWidget(),
      LoadedState<List<Publication>>() =>
        currentState.data.isNotEmpty
            ? PublicationsResultsListWidget(
              publications: currentState.data,
              domain: cubit.domain ?? '7200',
              language: cubit.currentLanguage,
            )
            : EmptyStateWidget(
              message: t.publications.results.empty,
              icon: Icons.article_outlined,
            ),
      ErrorState() => ErrorStateWidget(
        message: currentState.message,
        onRetry: cubit.refresh,
      ),
      _ => EmptyStateWidget(
        message: t.publications.results.initial,
        icon: Icons.article_outlined,
      ),
    };
  }
}

String _getMonthName(int month) {
  final monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return monthNames[month - 1];
}
