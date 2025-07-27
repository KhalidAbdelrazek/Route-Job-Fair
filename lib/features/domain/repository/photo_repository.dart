import 'package:dartz/dartz.dart';
import 'package:route_task/core/errors/failure.dart';
import 'package:route_task/features/domain/entity/get_photo_resonse_entity.dart';

abstract class PhotoRepository {
  Future<Either<Failure, GetPhotoResponseEntity>> getPhotos({
    required int page,
    required int limit,
  });
}
