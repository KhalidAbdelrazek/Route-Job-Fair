import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/errors/failure.dart';
import 'package:route_task/core/network/network_info.dart';
import 'package:route_task/core/network/photo_api_service.dart';
import 'package:route_task/features/data/data%20source/remote/photo_remote_data_source.dart';
import 'package:route_task/features/data/model/get_photo_response_dm.dart';


@Injectable(as: PhotoRemoteDataSource)
class PhotoRemoteDataSourceImpl extends PhotoRemoteDataSource {
  final PhotoApiService photoApiService;
  final NetworkInfo networkInfo;

  PhotoRemoteDataSourceImpl({
    required this.photoApiService,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetPhotoResponseDm>> getPhotos({
    required int page,
    required int limit,
  }) async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NetworkFailure("No Internet Connection"));
    }

    try {
      final photos = await photoApiService.getPhotos(page: page, perPage: limit);
      return Right(photos);
    } on DioException catch (e) {
      return Left(ServerFailure("Server error: ${e.message}"));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: ${e.toString()}"));
    }
  }
}
