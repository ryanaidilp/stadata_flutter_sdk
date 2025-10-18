import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/subjects/presentation/cubit/subjects_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SubjectsParametersPanel extends StatefulWidget {
  const SubjectsParametersPanel({required this.domainController, super.key});

  final TextEditingController domainController;

  @override
  State<SubjectsParametersPanel> createState() =>
      _SubjectsParametersPanelState();
}

class _SubjectsParametersPanelState extends State<SubjectsParametersPanel> {
  List<SubjectCategory> _subjectCategories = [];
  bool _isLoadingCategories = false;
  String? _lastLoadedDomain;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<SubjectsCubit>();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Parameters',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceMd),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Domain *',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  TextFormField(
                    controller: widget.domainController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'e.g., 7200',
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                      errorText: cubit.validationError,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      context.read<SubjectsCubit>().setDomain(
                        value.isEmpty ? null : value,
                      );
                      // Load subject categories when domain changes
                      if (value.isNotEmpty && value.length >= 4) {
                        _loadSubjectCategories(value, cubit.currentLanguage);
                      } else {
                        setState(() {
                          _subjectCategories = [];
                          _lastLoadedDomain = null;
                        });
                      }
                    },
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Language',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  DropdownButtonFormField<DataLanguage>(
                    initialValue: cubit.currentLanguage,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                    items:
                        DataLanguage.values.map((lang) {
                          return DropdownMenuItem(
                            value: lang,
                            child: Text(
                              lang == DataLanguage.id
                                  ? context
                                      .t
                                      .instructions
                                      .languageLabels
                                      .indonesian
                                  : context
                                      .t
                                      .instructions
                                      .languageLabels
                                      .english,
                            ),
                          );
                        }).toList(),
                    onChanged: (DataLanguage? value) {
                      if (value != null) {
                        context.read<SubjectsCubit>().changeLanguage(value);
                        // Reload categories if domain is set
                        final domain = widget.domainController.text;
                        if (domain.isNotEmpty && domain.length >= 4) {
                          _loadSubjectCategories(domain, value);
                        }
                      }
                    },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Select the language for subject data',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Subject Category (Optional)',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      if (_isLoadingCategories) ...[
                        const Gap(AppSizes.spaceXs),
                        const SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ],
                    ],
                  ),
                  const Gap(AppSizes.spaceXs),
                  DropdownButtonFormField<int>(
                    initialValue: cubit.subjectCategoryID,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                    hint: Text(
                      _subjectCategories.isEmpty
                          ? 'Enter domain to load categories'
                          : 'Select a subject category',
                    ),
                    items:
                        _subjectCategories.map((category) {
                          return DropdownMenuItem(
                            value: category.id,
                            child: Text(category.name),
                          );
                        }).toList(),
                    onChanged:
                        _subjectCategories.isEmpty
                            ? null
                            : (int? value) {
                              context
                                  .read<SubjectsCubit>()
                                  .setSubjectCategoryID(value);
                            },
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Filter subjects by category',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              if (cubit.subjectCategoryID != null) ...[
                const Gap(AppSizes.spaceMd),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.read<SubjectsCubit>().clearFilters();
                    },
                    icon: const Icon(Icons.clear, size: 16),
                    label: const Text('Clear Filter'),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Future<void> _loadSubjectCategories(
    String domain,
    DataLanguage language,
  ) async {
    // Avoid reloading if domain and language haven't changed
    final cacheKey = '$domain-${language.name}';
    if (_lastLoadedDomain == cacheKey) {
      return;
    }

    setState(() {
      _isLoadingCategories = true;
    });

    try {
      final stadata = getIt<StadataFlutter>();
      final result = await stadata.list.subjectCategories(
        domain: domain,
        lang: language,
      );

      if (mounted) {
        setState(() {
          _subjectCategories = result.data;
          _isLoadingCategories = false;
          _lastLoadedDomain = cacheKey;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _subjectCategories = [];
          _isLoadingCategories = false;
          _lastLoadedDomain = null;
        });
      }
    }
  }
}
