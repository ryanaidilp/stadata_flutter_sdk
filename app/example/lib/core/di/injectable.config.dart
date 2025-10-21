// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:stadata_example/core/di/app_module.dart' as _i165;
import 'package:stadata_example/core/localization/localization_cubit.dart'
    as _i155;
import 'package:stadata_example/core/navigation/app_router.dart' as _i402;
import 'package:stadata_example/features/census_events/presentation/cubit/census_events_cubit.dart'
    as _i784;
import 'package:stadata_example/features/census_topics/presentation/cubit/census_topics_cubit.dart'
    as _i1009;
import 'package:stadata_example/features/census_topics/presentation/cubit/census_topics_results_cubit.dart'
    as _i804;
import 'package:stadata_example/features/domains/presentation/cubit/domains_cubit.dart'
    as _i874;
import 'package:stadata_example/features/domains/presentation/cubit/domains_results_cubit.dart'
    as _i316;
import 'package:stadata_example/features/home/presentation/cubit/home_cubit.dart'
    as _i91;
import 'package:stadata_example/features/infographics/presentation/cubit/infographics_cubit.dart'
    as _i885;
import 'package:stadata_example/features/infographics/presentation/cubit/infographics_results_cubit.dart'
    as _i574;
import 'package:stadata_example/features/news/presentation/cubit/news_cubit.dart'
    as _i369;
import 'package:stadata_example/features/news/presentation/cubit/news_detail_cubit.dart'
    as _i436;
import 'package:stadata_example/features/news/presentation/cubit/news_results_cubit.dart'
    as _i1047;
import 'package:stadata_example/features/news_categories/presentation/cubit/news_categories_cubit.dart'
    as _i231;
import 'package:stadata_example/features/news_categories/presentation/cubit/news_categories_results_cubit.dart'
    as _i102;
import 'package:stadata_example/features/press_releases/presentation/cubit/press_release_detail_cubit.dart'
    as _i856;
import 'package:stadata_example/features/press_releases/presentation/cubit/press_releases_cubit.dart'
    as _i979;
import 'package:stadata_example/features/press_releases/presentation/cubit/press_releases_results_cubit.dart'
    as _i443;
import 'package:stadata_example/features/publications/presentation/cubit/publication_detail_cubit.dart'
    as _i812;
import 'package:stadata_example/features/publications/presentation/cubit/publications_cubit.dart'
    as _i1028;
import 'package:stadata_example/features/publications/presentation/cubit/publications_results_cubit.dart'
    as _i838;
import 'package:stadata_example/features/statistical_classifications/presentation/cubit/statistical_classifications_cubit.dart'
    as _i555;
import 'package:stadata_example/features/statistical_classifications/presentation/cubit/statistical_classifications_results_cubit.dart'
    as _i786;
import 'package:stadata_example/features/strategic_indicators/presentation/cubit/strategic_indicators_cubit.dart'
    as _i536;
import 'package:stadata_example/features/strategic_indicators/presentation/cubit/strategic_indicators_results_cubit.dart'
    as _i132;
import 'package:stadata_example/features/subject_categories/presentation/cubit/subject_categories_cubit.dart'
    as _i302;
import 'package:stadata_example/features/subject_categories/presentation/cubit/subject_categories_results_cubit.dart'
    as _i131;
import 'package:stadata_example/features/subjects/presentation/cubit/subjects_cubit.dart'
    as _i866;
import 'package:stadata_example/features/subjects/presentation/cubit/subjects_results_cubit.dart'
    as _i786;
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart' as _i759;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i91.HomeCubit>(() => _i91.HomeCubit());
    gh.factory<_i874.DomainsCubit>(() => _i874.DomainsCubit());
    gh.factory<_i555.StatisticalClassificationsCubit>(
      () => _i555.StatisticalClassificationsCubit(),
    );
    gh.factory<_i1028.PublicationsCubit>(() => _i1028.PublicationsCubit());
    gh.factory<_i302.SubjectCategoriesCubit>(
      () => _i302.SubjectCategoriesCubit(),
    );
    gh.factory<_i885.InfographicsCubit>(() => _i885.InfographicsCubit());
    gh.factory<_i866.SubjectsCubit>(() => _i866.SubjectsCubit());
    gh.factory<_i231.NewsCategoriesCubit>(() => _i231.NewsCategoriesCubit());
    gh.factory<_i979.PressReleasesCubit>(() => _i979.PressReleasesCubit());
    gh.singleton<_i759.StadataFlutter>(() => appModule.stadataFlutter);
    gh.singleton<_i155.LocalizationCubit>(() => _i155.LocalizationCubit());
    gh.lazySingleton<_i402.AppRouter>(() => _i402.AppRouter());
    gh.factory<_i316.DomainsResultsCubit>(
      () => _i316.DomainsResultsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i786.StatisticalClassificationsResultsCubit>(
      () => _i786.StatisticalClassificationsResultsCubit(
        gh<_i759.StadataFlutter>(),
      ),
    );
    gh.factory<_i812.PublicationDetailCubit>(
      () => _i812.PublicationDetailCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i838.PublicationsResultsCubit>(
      () => _i838.PublicationsResultsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i131.SubjectCategoriesResultsCubit>(
      () => _i131.SubjectCategoriesResultsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i574.InfographicsResultsCubit>(
      () => _i574.InfographicsResultsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i1047.NewsResultsCubit>(
      () => _i1047.NewsResultsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i369.NewsCubit>(
      () => _i369.NewsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i436.NewsDetailCubit>(
      () => _i436.NewsDetailCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i786.SubjectsResultsCubit>(
      () => _i786.SubjectsResultsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i102.NewsCategoriesResultsCubit>(
      () => _i102.NewsCategoriesResultsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i536.StrategicIndicatorsCubit>(
      () => _i536.StrategicIndicatorsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i132.StrategicIndicatorsResultsCubit>(
      () => _i132.StrategicIndicatorsResultsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i443.PressReleasesResultsCubit>(
      () => _i443.PressReleasesResultsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i856.PressReleaseDetailCubit>(
      () => _i856.PressReleaseDetailCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i784.CensusEventsCubit>(
      () => _i784.CensusEventsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i804.CensusTopicsResultsCubit>(
      () => _i804.CensusTopicsResultsCubit(gh<_i759.StadataFlutter>()),
    );
    gh.factory<_i1009.CensusTopicsCubit>(
      () => _i1009.CensusTopicsCubit(gh<_i759.StadataFlutter>()),
    );
    return this;
  }
}

class _$AppModule extends _i165.AppModule {}
