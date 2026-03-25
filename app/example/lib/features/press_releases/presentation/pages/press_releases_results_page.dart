import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/press_releases/presentation/cubit/press_releases_results_cubit.dart';
import 'package:stadata_example/features/press_releases/presentation/widgets/press_releases_results_list_widget.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class PressReleasesResultsPage extends StatelessWidget {
  const PressReleasesResultsPage({
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
    return BlocProvider(
      create:
          (context) =>
              getIt<PressReleasesResultsCubit>()..initialize(
                domain: domain,
                language: language,
                keyword: keyword,
                month: month,
                year: year,
              ),
      child: BlocBuilder<PressReleasesResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<PressReleasesResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              unawaited(cubit.loadData());
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Press Releases Results'),
              actions: [
                const AliceButton(),
                IconButton(
                  onPressed: cubit.refresh,
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh',
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
                    _PressReleasesParametersPanel(cubit: cubit),

                    const Gap(AppSizes.spaceLg),

                    _PressReleasesMainContent(state: state, cubit: cubit),

                    if (state is LoadedState<List<PressRelease>> &&
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

class _PressReleasesParametersPanel extends StatelessWidget {
  const _PressReleasesParametersPanel({required this.cubit});

  final PressReleasesResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ResultsParametersPanel(
      title: 'Search Parameters',
      headerBottomSpacing: AppSizes.spaceSm,
      chips: [
        ResultsParameterChip(
          icon: Icons.domain,
          text: 'Domain: ${cubit.domain ?? '-'}',
        ),
        ResultsParameterChip(
          icon: Icons.language,
          text:
              'Language: ${cubit.currentLanguage == DataLanguage.id ? 'Indonesian' : 'English'}',
        ),
        if (cubit.keyword != null)
          ResultsParameterChip(
            icon: Icons.search,
            text: 'Keyword: ${cubit.keyword!}',
          ),
        if (cubit.month != null)
          ResultsParameterChip(
            icon: Icons.calendar_month,
            text: 'Month: ${_getPressReleasesMonthName(cubit.month!)}',
          ),
        if (cubit.year != null)
          ResultsParameterChip(
            icon: Icons.calendar_today,
            text: 'Year: ${cubit.year}',
          ),
      ],
    );
  }
}

class _PressReleasesMainContent extends StatelessWidget {
  const _PressReleasesMainContent({required this.state, required this.cubit});

  final BaseState state;
  final PressReleasesResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final currentState = state;

    return switch (currentState) {
      LoadingState() => const LoadingWidget(),
      LoadedState<List<PressRelease>>() =>
        currentState.data.isNotEmpty
            ? PressReleasesResultsListWidget(
              pressReleases: currentState.data,
              domain: cubit.domain ?? '7200',
              language: cubit.currentLanguage,
              onPressReleaseTap: (pressRelease) {
                unawaited(
                  context.router.push(
                    PressReleaseDetailRoute(
                      pressReleaseId: pressRelease.id,
                      domain: cubit.domain ?? '7200',
                      language: cubit.currentLanguage,
                    ),
                  ),
                );
              },
            )
            : const EmptyStateWidget(
              message: 'No press releases found',
              icon: Icons.article_outlined,
            ),
      ErrorState() => ErrorStateWidget(
        message: currentState.message,
        onRetry: cubit.refresh,
      ),
      _ => const EmptyStateWidget(
        message: 'Press search button to load data',
        icon: Icons.article_outlined,
      ),
    };
  }
}

String _getPressReleasesMonthName(int month) {
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
