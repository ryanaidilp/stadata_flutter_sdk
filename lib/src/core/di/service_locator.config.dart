// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas, public_member_api_docs, cascade_invocations
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i11;
import 'package:stadata_flutter_sdk/src/core/di/register_module.dart' as _i16;
import 'package:stadata_flutter_sdk/src/core/log/log.dart' as _i15;
import 'package:stadata_flutter_sdk/src/core/network/http/http_client.dart'
    as _i8;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_http_module.dart'
    as _i12;
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart'
    as _i14;
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart' as _i9;
import 'package:stadata_flutter_sdk/src/core/storage/secure_storage_impl.dart'
    as _i10;
import 'package:stadata_flutter_sdk/src/list/domains/data/datasources/domain_remote_data_source.dart'
    as _i3;
import 'package:stadata_flutter_sdk/src/list/domains/data/repositories/domain_repository_impl.dart'
    as _i5;
import 'package:stadata_flutter_sdk/src/list/domains/domain/repositories/domain_repository.dart'
    as _i4;
import 'package:stadata_flutter_sdk/src/list/domains/domain/usecases/get_domains.dart'
    as _i7;
import 'package:stadata_flutter_sdk/src/list/list.dart' as _i13;

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
    () => _i3.DomainRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i4.DomainRepository>(() => _i5.DomainRepositoryImpl());
  gh.factory<_i6.FlutterSecureStorage>(() => registerModule.secureStorage);
  gh.lazySingleton<_i7.GetDomains>(() => _i7.GetDomains());
  gh.factory<_i8.HttpClient>(() => registerModule.httpClient);
  gh.factory<_i8.HttpClient>(
    () => registerModule.listHttpClient,
    instanceName: 'listClient',
  );
  gh.factory<_i8.HttpClient>(
    () => registerModule.viewHttpClient,
    instanceName: 'viewClient',
  );
  gh.lazySingleton<_i9.LocalStorage>(
    () => _i10.SecureStorageImpl(gh<_i6.FlutterSecureStorage>()),
    instanceName: 'secure',
  );
  gh.factory<_i11.Logger>(() => registerModule.logger);
  gh.lazySingleton<_i12.StadataHttpModule>(() => _i12.StadataHttpModule());
  gh.lazySingleton<_i13.StadataList>(() => _i13.StadataListImpl());
  gh.lazySingleton<_i14.StadataListHttpModule>(
    () => _i14.StadataListHttpModule(),
  );
  gh.lazySingleton<_i15.Log>(() => _i15.Log(gh<_i11.Logger>()));
  return getIt;
}

class _$RegisterModule extends _i16.RegisterModule {}
