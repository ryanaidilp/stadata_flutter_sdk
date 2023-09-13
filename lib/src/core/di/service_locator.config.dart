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
import 'package:logger/logger.dart' as _i13;
import 'package:stadata_flutter_sdk/src/core/di/register_module.dart' as _i23;
import 'package:stadata_flutter_sdk/src/core/log/log.dart' as _i22;
import 'package:stadata_flutter_sdk/src/core/network/http/http_client.dart'
    as _i10;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_http_module.dart'
    as _i17;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart'
    as _i19;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart'
    as _i21;
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart'
    as _i11;
import 'package:stadata_flutter_sdk/src/core/storage/secure_storage_impl.dart'
    as _i12;
import 'package:stadata_flutter_sdk/src/features/domains/data/datasources/domain_remote_data_source.dart'
    as _i3;
import 'package:stadata_flutter_sdk/src/features/domains/data/repositories/domain_repository_impl.dart'
    as _i5;
import 'package:stadata_flutter_sdk/src/features/domains/domain/repositories/domain_repository.dart'
    as _i4;
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart'
    as _i9;
import 'package:stadata_flutter_sdk/src/features/publications/data/datasources/publication_remote_data_source.dart'
    as _i14;
import 'package:stadata_flutter_sdk/src/features/publications/data/repositories/publication_repository_impl.dart'
    as _i16;
import 'package:stadata_flutter_sdk/src/features/publications/domain/repositories/publication_repository.dart'
    as _i15;
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart'
    as _i7;
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_detail_publication.dart'
    as _i8;
import 'package:stadata_flutter_sdk/src/list/list.dart' as _i18;
import 'package:stadata_flutter_sdk/src/view/view.dart' as _i20;

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
  gh.lazySingleton<_i7.GetAllPublication>(() => _i7.GetAllPublication());
  gh.lazySingleton<_i8.GetDetailPublication>(() => _i8.GetDetailPublication());
  gh.lazySingleton<_i9.GetDomains>(() => _i9.GetDomains());
  gh.factory<_i10.HttpClient>(() => registerModule.httpClient);
  gh.factory<_i10.HttpClient>(
    () => registerModule.listHttpClient,
    instanceName: 'listClient',
  );
  gh.factory<_i10.HttpClient>(
    () => registerModule.viewHttpClient,
    instanceName: 'viewClient',
  );
  gh.lazySingleton<_i11.LocalStorage>(
    () => _i12.SecureStorageImpl(gh<_i6.FlutterSecureStorage>()),
    instanceName: 'secure',
  );
  gh.factory<_i13.Logger>(() => registerModule.logger);
  gh.lazySingleton<_i14.PublicationRemoteDataSource>(
      () => _i14.PublicationRemoteDataSourceImpl());
  gh.lazySingleton<_i15.PublicationRepository>(
      () => _i16.PublicationRepositoryImpl());
  gh.lazySingleton<_i17.StadataHttpModule>(() => _i17.StadataHttpModule());
  gh.lazySingleton<_i18.StadataList>(() => _i18.StadataListImpl());
  gh.lazySingleton<_i19.StadataListHttpModule>(
      () => _i19.StadataListHttpModule());
  gh.lazySingleton<_i20.StadataView>(() => _i20.StadataViewImpl());
  gh.lazySingleton<_i21.StadataViewHttpModule>(
      () => _i21.StadataViewHttpModule());
  gh.lazySingleton<_i22.Log>(() => _i22.Log(gh<_i13.Logger>()));
  return getIt;
}

class _$RegisterModule extends _i23.RegisterModule {}
