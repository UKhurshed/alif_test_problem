import 'package:alif_test/core/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DioExceptions implements Exception {
  static Failure fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        return CancelFailure();

      case DioErrorType.connectTimeout:
        return ConnectTimeOutFailure();

      case DioErrorType.other:
        return DioOtherFailure();

      case DioErrorType.receiveTimeout:
        return ReceiveTimeOutFailure();

      case DioErrorType.response:
        return handleError(
            dioError.response?.statusCode ?? 0, dioError.response?.data);

      case DioErrorType.sendTimeout:
        return SendTimeOutFailure();

      default:
        return SomethingWentWrongFailure();
    }
  }

  static Failure handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return BadRequestFailure();
      case 404:
        return NotFoundFailure();
      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
      case 505:
        return ServerFailure();
      default:
        return SomethingWentWrongFailure();
    }
  }
}

class MapFailureToLocalizationResource {
  static String fromFailure(BuildContext context, Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppLocalizations.of(context)!.serverFailure;
      case CacheFailure:
        return AppLocalizations.of(context)!.cacheFailure;
      case CancelFailure:
        return AppLocalizations.of(context)!.cancelFailure;
      case ConnectTimeOutFailure:
        return AppLocalizations.of(context)!.connectTimeOutFailure;
      case DioOtherFailure:
        return AppLocalizations.of(context)!.dioOtherFailure;
      case ReceiveTimeOutFailure:
        return AppLocalizations.of(context)!.receiveTimeOutFailure;
      case SendTimeOutFailure:
        return AppLocalizations.of(context)!.sendTimeOutFailure;
      case BadRequestFailure:
        return AppLocalizations.of(context)!.badRequestFailure;
      case NotFoundFailure:
        return AppLocalizations.of(context)!.notFoundFailure;
      default:
        return AppLocalizations.of(context)!.somethingWentWrongFailure;
    }
  }
}
