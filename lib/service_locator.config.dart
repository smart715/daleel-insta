// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import 'commons/network/api_client.dart' as _i4;
import 'commons/network/network_info.dart' as _i6;
import 'data/datasources/remote_datasource.dart' as _i7;
import 'data/repositories/repository_impl.dart' as _i9;
import 'domain/repositories/repository.dart' as _i8;
import 'module_registry.dart' as _i10;
import 'screens/manage_account/account_page/states/account_notifier.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AccountNotfier>(() => _i3.AccountNotfier());
  gh.lazySingleton<_i4.ApiClient>(() => _i4.ApiClient());
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => registerModule.connectionChecker);
  gh.factory<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl(
      connectionChecker: get<_i5.InternetConnectionChecker>()));
  gh.lazySingleton<_i7.RemoteDataSource>(
      () => _i7.RemoteDataSource(apiClient: get<_i4.ApiClient>()));
  gh.lazySingleton<_i8.Repository>(() => _i9.RepositoryImpl(
        networkInfo: get<_i6.NetworkInfo>(),
        remoteDataSource: get<_i7.RemoteDataSource>(),
      ));
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {}
