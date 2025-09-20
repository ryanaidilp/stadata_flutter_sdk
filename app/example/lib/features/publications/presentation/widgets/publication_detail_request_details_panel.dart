import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/domains/presentation/widgets/detail_row.dart';
import 'package:stadata_example/features/publications/presentation/cubit/publication_detail_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

class PublicationDetailRequestDetailsPanel extends StatelessWidget {
  const PublicationDetailRequestDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<PublicationDetailCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<PublicationDetailCubit>();
        final requestDetails = cubit.lastRequestDetails;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: AppSizes.spaceMd),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.spaceMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.code,
                      size: AppSizes.iconSm,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const Gap(AppSizes.spaceXs),
                    Text(
                      t.publications.requestDetails.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Gap(AppSizes.spaceMd),

                if (requestDetails == null)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSizes.spaceLg),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.outline.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 32,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const Gap(AppSizes.spaceSm),
                        Text(
                          t.publications.requestDetails.noRequest,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                else ...[
                  DetailRow(
                    label: t.publications.requestDetails.method,
                    value: requestDetails.method,
                  ),
                  const Gap(AppSizes.spaceSm),
                  DetailRow(
                    label: t.publications.requestDetails.url,
                    value: requestDetails.url,
                    isUrl: true,
                    onCopy:
                        () => _copyToClipboard(
                          context,
                          requestDetails.url,
                          t.publications.requestDetails.urlCopied,
                        ),
                  ),
                  const Gap(AppSizes.spaceSm),
                  DetailRow(
                    label: t.publications.requestDetails.parameters,
                    value: _formatParameters(requestDetails.parameters),
                    maxLines: 5,
                  ),
                  const Gap(AppSizes.spaceSm),
                  DetailRow(
                    label: t.publications.requestDetails.responseTime,
                    value:
                        '${requestDetails.responseTime?.inMilliseconds ?? 0}ms',
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  void _copyToClipboard(BuildContext context, String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  String _formatParameters(Map<String, dynamic> parameters) {
    final buffer = StringBuffer();
    for (final entry in parameters.entries) {
      buffer.writeln('${entry.key}: ${entry.value}');
    }
    return buffer.toString().trim();
  }
}
