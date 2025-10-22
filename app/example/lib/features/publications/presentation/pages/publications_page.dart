import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/features/publications/presentation/cubit/publication_detail_cubit.dart';
import 'package:stadata_example/features/publications/presentation/widgets/publication_detail_content.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class PublicationsPage extends StatelessWidget {
  const PublicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Redirect to parameters page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(context.router.replace(const PublicationsParametersRoute()));
    });

    return Scaffold(
      appBar: AppBar(title: Text(context.t.publications.title)),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

@RoutePage()
class PublicationDetailPage extends StatelessWidget {
  const PublicationDetailPage({
    required this.publicationId,
    required this.domain,
    required this.language,
    super.key,
  });

  final String publicationId;
  final DataLanguage language;
  final String domain;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<PublicationDetailCubit>()
                ..changeLanguage(language)
                ..changeDomain(domain)
                ..loadPublicationDetail(publicationId),
      child: PublicationDetailView(publicationId: publicationId),
    );
  }
}

class PublicationDetailView extends StatefulWidget {
  const PublicationDetailView({required this.publicationId, super.key});

  final String publicationId;

  @override
  State<PublicationDetailView> createState() => _PublicationDetailViewState();
}

class _PublicationDetailViewState extends State<PublicationDetailView> {
  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.publications.detail.title),
        actions: [
          // Language toggle
          BlocBuilder<PublicationDetailCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<PublicationDetailCubit>();
              return PopupMenuButton<DataLanguage>(
                icon: const Icon(Icons.language),
                tooltip: t.common.language,
                onSelected: (language) {
                  cubit.changeLanguage(language);
                  cubit.loadPublicationDetail(widget.publicationId);
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
          // Alice inspector button (debug only)
          const AliceButton(),
          // Refresh button
          BlocBuilder<PublicationDetailCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          context.read<PublicationDetailCubit>().refresh();
                        },
                tooltip: t.common.refresh,
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<PublicationDetailCubit, BaseState>(
        builder: (context, state) {
          return _buildContent(context, state);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, BaseState state) {
    final t = LocaleSettings.instance.currentTranslations;

    return switch (state) {
      InitialState() => const Center(child: Text('Initializing...')),
      LoadingState() => const LoadingWidget(),
      final LoadedState<Publication> state => PublicationDetailContent(
        publication: state.data,
      ),
      final ErrorState state => ErrorStateWidget(
        message: state.message,
        onRetry: () {
          context.read<PublicationDetailCubit>().refresh();
        },
      ),
      _ => Center(child: Text(t.common.unknownState)),
    };
  }
}
