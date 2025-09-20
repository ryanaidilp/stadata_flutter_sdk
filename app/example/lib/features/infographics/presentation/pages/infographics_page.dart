import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/infographics/presentation/cubit/infographics_cubit.dart';
import 'package:stadata_example/features/infographics/presentation/widgets/infographics_parameters_panel.dart';
import 'package:stadata_example/features/infographics/presentation/widgets/infographics_request_details_panel.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

@RoutePage()
class InfographicsPage extends StatelessWidget {
  const InfographicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<InfographicsCubit>()..initialize(),
      child: const InfographicsView(),
    );
  }
}

class InfographicsView extends StatefulWidget {
  const InfographicsView({super.key});

  @override
  State<InfographicsView> createState() => _InfographicsViewState();
}

class _InfographicsViewState extends State<InfographicsView> {
  final TextEditingController _domainController = TextEditingController(
    text: '7200',
  );
  final TextEditingController _keywordController = TextEditingController();
  final TextEditingController _pageController = TextEditingController(
    text: '1',
  );
  bool _showRequestDetails = false;

  @override
  void initState() {
    super.initState();

    // Listen to cubit changes to update page controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<InfographicsCubit>();
      _pageController.text = cubit.currentPage.toString();

      // Update page controller when cubit page changes
      _pageController.addListener(() {
        if (_pageController.text != cubit.currentPage.toString()) {
          _pageController.text = cubit.currentPage.toString();
        }
      });
    });
  }

  @override
  void dispose() {
    _domainController.dispose();
    _keywordController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.infographics.title),
        actions: [
          IconButton(
            icon: Icon(_showRequestDetails ? Icons.code_off : Icons.code),
            onPressed: () {
              setState(() {
                _showRequestDetails = !_showRequestDetails;
              });
            },
            tooltip:
                _showRequestDetails
                    ? t.infographics.requestDetails.hideDetails
                    : t.infographics.requestDetails.showDetails,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            children: [
              // Parameters Panel
              InfographicsParametersPanel(
                domainController: _domainController,
                keywordController: _keywordController,
                pageController: _pageController,
              ),

              // Request Details Panel (if enabled)
              if (_showRequestDetails)
                const Padding(
                  padding: EdgeInsets.only(top: AppSizes.spaceMd),
                  child: InfographicsRequestDetailsPanel(),
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

    return BlocBuilder<InfographicsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<InfographicsCubit>();
        final canSearch = cubit.canLoadData;

        return SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed:
                canSearch ? () => _navigateToResults(context, cubit) : null,
            icon: const Icon(Icons.search),
            label: Text(t.infographics.parameters.searchInfographics),
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
                t.infographics.education.title,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceSm),
          Text(
            t.infographics.education.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppSizes.spaceSm),
          _buildEducationPoint(
            context,
            t.infographics.education.parameters,
            t.infographics.education.parametersDescription,
          ),
          _buildEducationPoint(
            context,
            t.infographics.education.results,
            t.infographics.education.resultsDescription,
          ),
          _buildEducationPoint(
            context,
            t.infographics.education.detail,
            t.infographics.education.detailDescription,
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

  void _navigateToResults(BuildContext context, InfographicsCubit cubit) {
    context.router.push(
      InfographicsResultsRoute(
        domain: cubit.currentDomain,
        language: cubit.currentLanguage,
        keyword: cubit.keyword,
      ),
    );
  }
}
