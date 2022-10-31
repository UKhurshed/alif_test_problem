import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  static String fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        return "Запрос к серверу API был отменен";

      case DioErrorType.connectTimeout:
        return "Тайм-аут соединения с сервером API";

      case DioErrorType.other:
        return "При подключения к интернету произошел сбой";

      case DioErrorType.receiveTimeout:
        return "Тайм-аут получения в связи с сервером API";

      case DioErrorType.response:
        return handleError(
            dioError.response?.statusCode ?? 0, dioError.response?.data);

      case DioErrorType.sendTimeout:
        return "Тайм-аут отправки в связи с сервером API";

      default:
        return "Что-то пошло не так";
    }
  }

  static String handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Неверный запрос';
      case 404:
        return error["message"];
      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
      case 505:
        return 'Внутренняя ошибка сервера';
      default:
        return 'Что-то пошло не так';
    }
  }
}