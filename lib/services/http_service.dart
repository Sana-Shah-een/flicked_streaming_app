//Packages
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

//Models
import '../models/app_config.dart';

class HttpService {
  final Dio dio = Dio();
  final getIt = GetIt.instance;

  late String _base_url;
  late String _api_key;

  HttpService() {
    AppConfig config = getIt.get<AppConfig>();
    _base_url = config.BASE_API_URL;
    _api_key = config.API_KEY;
  }

  Future<Response> get(
    String path, {
    required Map<String, dynamic> query,
  }) async {
    try {
      String url = '$_base_url$path';
      Map<String, dynamic> query0 = {'api_key': _api_key, 'language': 'en-US'};
      query0.addAll(query);

      return await dio.get(url, queryParameters: query0);
    } on DioException catch (e) {
      throw Exception('Failed to perform GET request: $e');
    }
  }
}
