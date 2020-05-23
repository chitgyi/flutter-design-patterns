// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AppService implements AppService {
  _AppService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://jsonplaceholder.typicode.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getPosts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/posts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => PostModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getPhotos() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/photos',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => PhotoModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
