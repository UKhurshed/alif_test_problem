import 'package:dio/dio.dart';

class URL {
  static const base = 'https://guidebook.com/service/v2';
}

class API {
  final dio = createDio();

  API._internal();

  static final _singleton = API._internal();

  factory API() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(baseUrl: URL.base));

    return dio;
  }
}
