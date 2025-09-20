import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/domains/presentation/cubit/domains_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

/// Request details panel widget for domains
class DomainsRequestDetailsPanel extends StatelessWidget {
  const DomainsRequestDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<DomainsCubit, BaseState>(
      builder: (context, state) {
        // Parameters page doesn't make requests, so no details to show

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
              subtitle: Text(context.t.instructions.requestDetailsWillShow),
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSizes.spaceMd),
                  child: Text(
                    'This page only handles parameter configuration. Click "Search Domains" to see request details in the results page.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
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
