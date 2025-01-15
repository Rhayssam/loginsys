import 'dart:developer';

import 'package:loginsys/app/core/exceptions/user_notfound_exception.dart';
import 'package:loginsys/app/core/rest_client/rest_client.dart';
import 'package:loginsys/app/models/user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  // Future<void> register(String name, String email, String password) async {
  Future<UserModel> register(String name, String email, String password) async {
    // final result = await _restClient.post('/auth/register', {
    final result = await _restClient.post('/users', {
      'name': name,
      'email': email,
      'password': password,
    });
    if (result.hasError) {
      var message = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      log(message, error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message);
    }
    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient
        // .post('/auth/', {'email': email, 'password': password});
        // .post('/users', {'email': email, 'password': password});
        .get('/users?email=$email&password=$password');
    // log(result.body.toString());
    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'Usuário ou senha inválidos',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );
        throw UserNotFoundException();
      }
      log(
        'Erro ao autenticar o usuário(${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar usuário');
    }
    return UserModel.fromMap(result.body.first);
  }
}
