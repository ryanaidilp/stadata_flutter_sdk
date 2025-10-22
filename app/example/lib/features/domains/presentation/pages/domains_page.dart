import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/domains/presentation/cubit/domains_cubit.dart';
import 'package:stadata_example/features/domains/presentation/widgets/domains_parameters_panel.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@RoutePage()
class DomainsPage extends StatelessWidget {
  const DomainsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DomainsCubit>()..initialize(),
      child: const DomainsView(),
    );
  }
}

class DomainsView extends StatefulWidget {
  const DomainsView({super.key});

  @override
  State<DomainsView> createState() => _DomainsViewState();
}

class _DomainsViewState extends State<DomainsView> {
  final TextEditingController _provinceCodeController = TextEditingController();

  @override
  void dispose() {
    _provinceCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.domains.title),
        actions: [const AliceButton()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            children: [
              // Parameters Panel
              DomainsParametersPanel(
                provinceCodeController: _provinceCodeController,
              ),

              const Gap(AppSizes.spaceLg),

              // Search Button
              _buildSearchButton(context),

              const Gap(AppSizes.spaceLg),

              // Educational Information
              _buildEducationalInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<DomainsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<DomainsCubit>();
        final canSearch = cubit.canLoadData;

        return SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed:
                canSearch ? () => _navigateToResults(context, cubit) : null,
            icon: const Icon(Icons.search),
            label: Text(t.domains.parameters.searchDomains),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spaceLg,
                vertical: AppSizes.spaceMd,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEducationalInfo(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                t.domains.education.title,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceSm),
          Text(
            t.domains.education.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppSizes.spaceSm),
          _buildEducationPoint(
            context,
            t.domains.education.parameters,
            t.domains.education.parametersDescription,
          ),
          _buildEducationPoint(
            context,
            t.domains.education.results,
            t.domains.education.resultsDescription,
          ),
          _buildEducationPoint(
            context,
            t.domains.education.detail,
            t.domains.education.detailDescription,
          ),
        ],
      ),
    );
  }

  Widget _buildEducationPoint(
    BuildContext context,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToResults(BuildContext context, DomainsCubit cubit) {
    context.router.push(
      DomainsResultsRoute(
        type: cubit.currentType,
        language: cubit.currentLanguage,
        provinceCode: cubit.provinceCode,
      ),
    );
  }
}
