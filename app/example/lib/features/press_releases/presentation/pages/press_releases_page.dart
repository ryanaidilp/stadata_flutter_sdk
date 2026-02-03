import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/press_releases/presentation/cubit/press_release_detail_cubit.dart';
import 'package:stadata_example/features/press_releases/presentation/widgets/press_release_detail_content.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class PressReleasesPage extends StatelessWidget {
  const PressReleasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(context.router.replace(const PressReleasesParametersRoute()));
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Press Releases')),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

@RoutePage()
class PressReleaseDetailPage extends StatelessWidget {
  const PressReleaseDetailPage({
    required this.pressReleaseId,
    required this.domain,
    required this.language,
    super.key,
  });

  final int pressReleaseId;
  final DataLanguage language;
  final String domain;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<PressReleaseDetailCubit>()
                ..changeLanguage(language)
                ..changeDomain(domain)
                ..loadPressReleaseDetail(pressReleaseId),
      child: PressReleaseDetailView(pressReleaseId: pressReleaseId),
    );
  }
}

class PressReleaseDetailView extends StatefulWidget {
  const PressReleaseDetailView({required this.pressReleaseId, super.key});

  final int pressReleaseId;

  @override
  State<PressReleaseDetailView> createState() => _PressReleaseDetailViewState();
}

class _PressReleaseDetailViewState extends State<PressReleaseDetailView> {
  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pressReleases.detail.title),
        actions: [
          // Language toggle
          BlocBuilder<PressReleaseDetailCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<PressReleaseDetailCubit>();
              return PopupMenuButton<DataLanguage>(
                icon: const Icon(Icons.language),
                tooltip: t.common.language,
                onSelected: (language) {
                  cubit.changeLanguage(language);
                  cubit.loadPressReleaseDetail(widget.pressReleaseId);
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
          BlocBuilder<PressReleaseDetailCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          context.read<PressReleaseDetailCubit>().refresh(
                            widget.pressReleaseId,
                          );
                        },
                tooltip: t.common.refresh,
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<PressReleaseDetailCubit, BaseState>(
        builder: _buildContent,
      ),
    );
  }

  Widget _buildContent(BuildContext context, BaseState state) {
    final t = LocaleSettings.instance.currentTranslations;

    return switch (state) {
      InitialState() => const Center(child: Text('Initializing...')),
      LoadingState() => const LoadingWidget(),
      final LoadedState<PressRelease> state => PressReleaseDetailContent(
        pressRelease: state.data,
      ),
      final ErrorState state => ErrorStateWidget(
        message: state.message,
        onRetry: () {
          context.read<PressReleaseDetailCubit>().refresh(
            widget.pressReleaseId,
          );
        },
      ),
      _ => Center(child: Text(t.common.unknownState)),
    };
  }
}
