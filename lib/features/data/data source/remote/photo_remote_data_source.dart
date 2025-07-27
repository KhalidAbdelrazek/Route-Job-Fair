import 'package:dartz/dartz.dart';
import 'package:route_task/core/errors/failure.dart';
import 'package:route_task/features/data/model/get_photo_response_dm.dart';

abstract class PhotoRemoteDataSource {
  Future<Either<Failure, GetPhotoResponseDm>> getPhotos({
    required int page,
    required int limit,
  });
}
