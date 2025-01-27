// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class RestClient extends GetConnect {
  final _backendBaseUrl = 'http://10.24.24.172:8080';

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;
  RestClientException(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
