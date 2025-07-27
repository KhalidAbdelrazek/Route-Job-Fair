import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:route_task/core/api%20manager/api_constants.dart';
import 'package:route_task/core/api%20manager/api_endpints.dart';
import 'package:route_task/features/data/model/get_photo_response_dm.dart';

part 'photo_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PhotoApiService {
  factory PhotoApiService(Dio dio, {String baseUrl}) = _PhotoApiService;

@GET(ApiEndPoints.getPhotos)
Future<GetPhotoResponseDm> getPhotos({
  @Query('page') required int page,
  @Query('per_page') required int perPage,
});
}

// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:route_task/core/network/photo_api_service.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio()
      ..options.headers['Authorization'] = ApiConstants.apiKey;

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
    ));

    return dio;
  }

  @lazySingleton
  PhotoApiService providePhotoApiService(Dio dio) {
    return PhotoApiService(dio);
  }
}
