import 'dart:async';
import 'dart:io';

import 'package:get/get_connect/connect.dart';
import 'package:movie_app/core/base/base_api_request.dart';

import '../../core/constants/api_constants.dart';
import '../../core/constants/number_constants.dart';

class ApiService {
  static const requestTimeOut = Duration(seconds: NumberConstants.apiTimeOut);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = ApiService();

  static ApiService get instance => _singleton;

  Future request(BaseApiRequest request) async {
    try {
      final response = await _client.request(
        ApiConstants.baseUrl + request.path,
        request.method.string,
        headers:
            request.headers ??
            {
              "Authorization": "Bearer ${ApiConstants.token}",
              "Content-Type": "application/json",
            },
        query: request.query,
        body: request.body,
      );
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
    : super(
        code: "fetch-data",
        message: "Error During Communication",
        details: details,
      );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
    : super(
        code: "invalid-request",
        message: "Invalid Request",
        details: details,
      );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
    : super(code: "unauthorised", message: "Unauthorised", details: details);
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
    : super(code: "invalid-input", message: "Invalid Input", details: details);
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
    : super(
        code: "authentication-failed",
        message: "Authentication Failed",
        details: details,
      );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
    : super(
        code: "request-timeout",
        message: "Request TimeOut",
        details: details,
      );
}
