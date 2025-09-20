import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/news/presentation/cubit/news_detail_cubit.dart';
import 'package:stadata_example/features/news/presentation/widgets/news_detail_content.dart';
import 'package:stadata_example/features/news/presentation/widgets/news_detail_request_details_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({
    required this.newsId,
    super.key,
    this.language = DataLanguage.id,
    this.domain = '7200',
  });

  final int newsId;
  final DataLanguage language;
  final String domain;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<NewsDetailCubit>()
                ..changeLanguage(language)
                ..changeDomain(domain)
                ..loadNewsDetail(newsId),
      child: NewsDetailView(newsId: newsId),
    );
  }
}

class NewsDetailView extends StatefulWidget {
  const NewsDetailView({required this.newsId, super.key});

  final int newsId;

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  bool _showRequestDetails = false;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.news.detail.title),
        actions: [
          // Language toggle
          BlocBuilder<NewsDetailCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<NewsDetailCubit>();
              return PopupMenuButton<DataLanguage>(
                icon: const Icon(Icons.language),
                tooltip: t.common.language,
                onSelected: (language) {
                  cubit.changeLanguage(language);
                  cubit.loadNewsDetail(widget.newsId);
                },
                itemBuilder:
                    (context) => [
                      PopupMenuItem(
                        value: DataLanguage.id,
                        child: Row(
                          children: [
                            if (cubit.currentLanguage == DataLanguage.id)
                              const Icon(Icons.check, size: 16),
                            if (cubit.currentLanguage == DataLanguage.id)
                              const Gap(AppSizes.spaceXs),
                            const Text('Bahasa Indonesia'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: DataLanguage.en,
                        child: Row(
                          children: [
                            if (cubit.currentLanguage == DataLanguage.en)
                              const Icon(Icons.check, size: 16),
                            if (cubit.currentLanguage == DataLanguage.en)
                              const Gap(AppSizes.spaceXs),
                            const Text('English'),
                          ],
                        ),
                      ),
                    ],
              );
            },
          ),
          // Request details toggle
          IconButton(
            icon: Icon(_showRequestDetails ? Icons.code_off : Icons.code),
            onPressed: () {
              setState(() {
                _showRequestDetails = !_showRequestDetails;
              });
            },
            tooltip:
                _showRequestDetails
                    ? t.news.requestDetails.hideDetails
                    : t.news.requestDetails.showDetails,
          ),
          // Refresh button
          BlocBuilder<NewsDetailCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          context.read<NewsDetailCubit>().refresh(
                            widget.newsId,
                          );
                        },
                tooltip: t.common.refresh,
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<NewsDetailCubit, BaseState>(
        builder: (context, state) {
          return Column(
            children: [
              // Request Details Panel (if enabled)
              if (_showRequestDetails)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(AppSizes.spaceMd),
                  child: const NewsDetailRequestDetailsPanel(),
                ),

              // Main Content
              Expanded(child: _buildContent(context, state)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, BaseState state) {
    return switch (state) {
      InitialState() => const Center(child: Text('Initializing...')),
      LoadingState() => const LoadingWidget(),
      final LoadedState<News> state => NewsDetailContent(news: state.data),
      final ErrorState state => ErrorStateWidget(
        message: state.message,
        onRetry: () {
          context.read<NewsDetailCubit>().refresh(widget.newsId);
        },
      ),
      _ => Center(child: Text(t.common.unknownState)),
    };
  }
}
