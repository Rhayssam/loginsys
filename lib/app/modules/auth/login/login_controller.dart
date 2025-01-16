import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loginsys/app/core/constants/constants.dart';
import 'package:loginsys/app/core/exceptions/user_notfound_exception.dart';
import 'package:loginsys/app/core/mixins/loader_mixin.dart';
import 'package:loginsys/app/core/mixins/messages_mixin.dart';
import 'package:loginsys/app/repositories/auth/auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.login(email, password);
      // log('Deu certo');
      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLogged.id);

      _loading.toggle();
    } on UserNotFoundException catch (e, s) {
      _loading.toggle();
      log('Login ou senha inválidos', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Login ou senha inválido',
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Login ou senha inválidos adasdasd', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Login ou senha inválido',
        type: MessageType.error,
      ));
    }
  }
}
