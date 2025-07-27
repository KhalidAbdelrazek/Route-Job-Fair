// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/data/data%20source/local/photo_local_data_source.dart'
    as _i281;
import '../../features/data/data%20source/local/photo_local_data_source_impl.dart'
    as _i130;
import '../../features/data/data%20source/remote/photo_remote_data_source.dart'
    as _i592;
import '../../features/data/data%20source/remote/photo_remote_data_source_impl.dart'
    as _i1036;
import '../../features/data/repository/photo_repository_impl.dart' as _i943;
import '../../features/domain/repository/photo_repository.dart' as _i450;
import '../../features/domain/use%20case/get_photos_use_case.dart' as _i265;
import '../../features/ui/cubit/photo_cubit.dart' as _i834;
import '../api%20manager/api_manager.dart' as _i949;
import '../network/network_info.dart' as _i932;
import '../network/photo_api_service.dart' as _i523;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i949.ApiManager>(() => _i949.ApiManager());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i281.PhotoLocalDataSource>(
        () => _i130.PhotoLocalDataSourceImpl());
    gh.lazySingleton<_i523.PhotoApiService>(
        () => registerModule.providePhotoApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i932.NetworkInfo>(() => _i932.NetworkInfoImpl());
    gh.factory<_i592.PhotoRemoteDataSource>(
        () => _i1036.PhotoRemoteDataSourceImpl(
              photoApiService: gh<_i523.PhotoApiService>(),
              networkInfo: gh<_i932.NetworkInfo>(),
            ));
    gh.lazySingleton<_i450.PhotoRepository>(() => _i943.PhotoRepositoryImpl(
          gh<_i592.PhotoRemoteDataSource>(),
          gh<_i281.PhotoLocalDataSource>(),
        ));
    gh.lazySingleton<_i265.GetPhotosUseCase>(
        () => _i265.GetPhotosUseCase(gh<_i450.PhotoRepository>()));
    gh.factory<_i834.PhotoCubit>(
        () => _i834.PhotoCubit(gh<_i265.GetPhotosUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i523.RegisterModule {}
