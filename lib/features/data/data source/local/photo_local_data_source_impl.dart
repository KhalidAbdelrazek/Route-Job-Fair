import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/features/data/data%20source/local/photo_local_data_source.dart';
import 'package:route_task/features/data/model/get_photo_response_dm.dart';

@LazySingleton(as: PhotoLocalDataSource)
class PhotoLocalDataSourceImpl implements PhotoLocalDataSource {
  static const String photoBoxKey = 'photoBox1';

  @override
  Future<void> cachePhotosByPage(GetPhotoResponseDm response) async {
    try {
      final box = await Hive.openBox<GetPhotoResponseDm>(photoBoxKey);

      await box.put(response.page.toString(), response);
      print("✅ Page ${response.page} cached successfully.");

      await box.close();
    } catch (e) {
      print("❌ Error caching page ${response.page}: $e");
    }
  }

  @override
  Future<GetPhotoResponseDm?> getCachedPhotosByPage(int page) async {
    try {
      final box = await Hive.openBox<GetPhotoResponseDm>(photoBoxKey);

      final response = box.get(page.toString());
      if (response != null) {
        print("✅ Page $page fetched successfully.");
      } else {
        print("⚠️ No valid cache found for page $page.");
        return null;
      }

      await box.close();
      return response;
    } catch (e) {
      print("❌ Error while fetching page $page: $e");
      return null;
    }
  }

  @override
  Future<void> clearCachedPhotos() async {
    try {
      final box = await Hive.openBox<GetPhotoResponseDm>(photoBoxKey);
      await box.clear();
      await box.close();
      print("🧹 Cache cleared successfully.");
    } catch (e) {
      print("❌ Error while clearing cache: $e");
    }
  }

  @override
  Future<void> deleteBoxFromDisk() async {
    try {
      await Hive.deleteBoxFromDisk(photoBoxKey);
      print("🗑️ Box deleted from disk successfully.");
    } catch (e) {
      print("❌ Error deleting box: $e");
    }
  }
}
