import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/errors/failure.dart';
import 'package:route_task/features/data/data%20source/local/photo_local_data_source.dart';
import 'package:route_task/features/data/data%20source/remote/photo_remote_data_source.dart';
import 'package:route_task/features/domain/entity/get_photo_resonse_entity.dart';
import 'package:route_task/features/domain/repository/photo_repository.dart';

@LazySingleton(as: PhotoRepository)
class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource remoteDataSource;
  final PhotoLocalDataSource localDataSource;

  PhotoRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, GetPhotoResponseEntity>> getPhotos({
    required int page,
    required int limit,
  }) async {
    try {
      print('Fetching photos from remote data source...');
      final remoteResult = await remoteDataSource.getPhotos(
        page: page,
        limit: limit,
      );
      print('Remote data source fetch completed.');
      return remoteResult.fold(
        (failure) async {
          // Fallback to cache
          final cached = await localDataSource.getCachedPhotosByPage(page);
          if (cached != null) {
            return Right(cached);
          }
          return Left(failure);
        },
        (entity) async {
          // Cache successful page
          print('Caching photos for page $page...');
          await localDataSource.cachePhotosByPage(entity);
          print('Photos for page $page cached successfully.');
          return Right(entity);
        },
      );
    } catch (e) {
      print('fetchPhotos error: $e');
      final cached = await localDataSource.getCachedPhotosByPage(page);
      if (cached != null) return Right(cached);
      print('object');
      return Left(ServerFailure('Error fetching photos'));
    }
  }
}
