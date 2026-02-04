// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/login/data/data_source/login_remote_data_source.dart'
    as _i678;
import '../../features/login/data/data_source/login_remote_data_source_impl.dart'
    as _i863;
import '../../features/login/data/repos/login_repo.dart' as _i820;
import '../../features/login/data/repos/login_repo_impl.dart' as _i937;
import '../api_manager/api_service.dart' as _i1065;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i1065.ApiService>(
      () => registerModule.getApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i678.LoginRemoteDataSource>(
      () => _i863.LoginRemoteDataSourceImpl(gh<_i1065.ApiService>()),
    );
    gh.factory<_i820.LoginRepo>(
      () => _i937.LoginRepoImpl(gh<_i678.LoginRemoteDataSource>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
