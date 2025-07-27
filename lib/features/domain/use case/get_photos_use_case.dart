import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/errors/failure.dart';
import 'package:route_task/features/domain/entity/get_photo_resonse_entity.dart';
import 'package:route_task/features/domain/repository/photo_repository.dart';

@lazySingleton
class GetPhotosUseCase {
  final PhotoRepository repo;

  GetPhotosUseCase(this.repo);

  Future<Either<Failure, GetPhotoResponseEntity>> call({
    required int page,
    required int limit,
  }) {
    return repo.getPhotos(page: page, limit: limit);
  }
}
