import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test_changenotifier/dao/photo_model.dart';
import 'package:test_changenotifier/dao/post_modal.dart';
import 'package:test_changenotifier/utils/app_constants.dart';

part 'app_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;
  @GET("/posts")
  Future<List<PostModel>> getPosts();

  @GET("/photos")
  Future<List<PhotoModel>> getPhotos();
}
