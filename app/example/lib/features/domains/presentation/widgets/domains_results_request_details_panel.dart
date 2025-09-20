import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/domains/presentation/cubit/domains_results_cubit.dart';
import 'package:stadata_example/features/domains/presentation/widgets/detail_row.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

/// Request details panel widget for domains results
class DomainsResultsRequestDetailsPanel extends StatelessWidget {
  const DomainsResultsRequestDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<DomainsResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<DomainsResultsCubit>();
        final requestDetails = cubit.lastRequestDetails;

        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppSizes.spaceMd,
            vertical: AppSizes.spaceSm,
          ),
          child: Card(
            child: ExpansionTile(
              collapsedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              leading: Icon(
                Icons.api,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                t.domains.requestDetails.title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle:
                  requestDetails != null
                      ? Text(
                        '${t.domains.requestDetails.responseTime}: ${requestDetails.responseTime?.inMilliseconds}ms',
                      )
                      : Text(t.domains.requestDetails.noRequest),
              children: [
                if (requestDetails != null)
                  Padding(
                    padding: const EdgeInsets.all(AppSizes.spaceMd),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailRow(
                          label: t.domains.requestDetails.method,
                          value: requestDetails.method,
                        ),
                        const Gap(AppSizes.spaceXs),
                        DetailRow(
                          label: t.domains.requestDetails.url,
                          value: requestDetails.url,
                        ),
                        const Gap(AppSizes.spaceXs),
                        DetailRow(
                          label: t.domains.requestDetails.parameters,
                          value:
                              requestDetails.parameters.isEmpty
                                  ? t.common.noData
                                  : requestDetails.parameters.entries
                                      .map((e) => '${e.key}: ${e.value}')
                                      .join(', '),
                        ),
                        const Gap(AppSizes.spaceXs),
                        if (requestDetails.responseTime != null)
                          DetailRow(
                            label: t.domains.requestDetails.responseTime,
                            value:
                                '${requestDetails.responseTime!.inMilliseconds}ms',
                          ),
                        const Gap(AppSizes.spaceMd),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: requestDetails.url),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    t.domains.requestDetails.urlCopied,
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: const Icon(Icons.copy),
                            label: Text(t.domains.requestDetails.copyUrl),
                          ),
                        ),
                        const Gap(AppSizes.spaceMd),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
