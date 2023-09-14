// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i18;
import 'package:stadata_flutter_sdk/src/core/di/register_module.dart' as _i27;
import 'package:stadata_flutter_sdk/src/core/log/log.dart' as _i17;
import 'package:stadata_flutter_sdk/src/core/network/http/http_client.dart'
    as _i11;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_http_module.dart'
    as _i22;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart'
    as _i24;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart'
    as _i26;
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart'
    as _i15;
import 'package:stadata_flutter_sdk/src/core/storage/secure_storage_impl.dart'
    as _i16;
import 'package:stadata_flutter_sdk/src/features/domains/data/datasources/domain_remote_data_source.dart'
    as _i3;
import 'package:stadata_flutter_sdk/src/features/domains/data/repositories/domain_repository_impl.dart'
    as _i5;
import 'package:stadata_flutter_sdk/src/features/domains/domain/repositories/domain_repository.dart'
    as _i4;
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart'
    as _i10;
import 'package:stadata_flutter_sdk/src/features/infographics/data/datasources/infographic_remote_data_source.dart'
    as _i12;
import 'package:stadata_flutter_sdk/src/features/infographics/data/repositories/infographic_repository_impl.dart'
    as _i14;
import 'package:stadata_flutter_sdk/src/features/infographics/domain/repositories/infographic_repository.dart'
    as _i13;
import 'package:stadata_flutter_sdk/src/features/infographics/domain/usecases/get_all_infographics.dart'
    as _i7;
import 'package:stadata_flutter_sdk/src/features/publications/data/datasources/publication_remote_data_source.dart'
    as _i19;
import 'package:stadata_flutter_sdk/src/features/publications/data/repositories/publication_repository_impl.dart'
    as _i21;
import 'package:stadata_flutter_sdk/src/features/publications/domain/repositories/publication_repository.dart'
    as _i20;
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart'
    as _i8;
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_detail_publication.dart'
    as _i9;
import 'package:stadata_flutter_sdk/src/list/list.dart' as _i23;
import 'package:stadata_flutter_sdk/src/view/view.dart' as _i25;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.DomainRemoteDataSource>(
      () => _i3.DomainRemoteDataSourceImpl());
  gh.lazySingleton<_i4.DomainRepository>(() => _i5.DomainRepositoryImpl());
  gh.factory<_i6.FlutterSecureStorage>(() => registerModule.secureStorage);
  gh.lazySingleton<_i7.GetAllInfographics>(() => _i7.GetAllInfographics());
  gh.lazySingleton<_i8.GetAllPublication>(() => _i8.GetAllPublication());
  gh.lazySingleton<_i9.GetDetailPublication>(() => _i9.GetDetailPublication());
  gh.lazySingleton<_i10.GetDomains>(() => _i10.GetDomains());
  gh.factory<_i11.HttpClient>(() => registerModule.httpClient);
  gh.factory<_i11.HttpClient>(
    () => registerModule.listHttpClient,
    instanceName: 'listClient',
  );
  gh.factory<_i11.HttpClient>(
    () => registerModule.viewHttpClient,
    instanceName: 'viewClient',
  );
  gh.lazySingleton<_i12.InfographicRemoteDataSource>(
      () => _i12.InfographicRemoteDataSourceImpl());
  gh.lazySingleton<_i13.InfographicRepository>(
      () => _i14.InfographicRepositoryImpl());
  gh.lazySingleton<_i15.LocalStorage>(
    () => _i16.SecureStorageImpl(),
    instanceName: 'secure',
  );
  gh.lazySingleton<_i17.Log>(() => _i17.Log());
  gh.factory<_i18.Logger>(() => registerModule.logger);
  gh.lazySingleton<_i19.PublicationRemoteDataSource>(
      () => _i19.PublicationRemoteDataSourceImpl());
  gh.lazySingleton<_i20.PublicationRepository>(
      () => _i21.PublicationRepositoryImpl());
  gh.lazySingleton<_i22.StadataHttpModule>(() => _i22.StadataHttpModule());
  gh.lazySingleton<_i23.StadataList>(() => _i23.StadataListImpl());
  gh.lazySingleton<_i24.StadataListHttpModule>(
      () => _i24.StadataListHttpModule());
  gh.lazySingleton<_i25.StadataView>(() => _i25.StadataViewImpl());
  gh.lazySingleton<_i26.StadataViewHttpModule>(
      () => _i26.StadataViewHttpModule());
  return getIt;
}

class _$RegisterModule extends _i27.RegisterModule {}
