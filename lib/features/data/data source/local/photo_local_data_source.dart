import 'package:route_task/features/data/model/get_photo_response_dm.dart';

abstract class PhotoLocalDataSource {
  Future<void> cachePhotosByPage(GetPhotoResponseDm response);
  Future<GetPhotoResponseDm?> getCachedPhotosByPage(int page);
  Future<void> clearCachedPhotos();
}
