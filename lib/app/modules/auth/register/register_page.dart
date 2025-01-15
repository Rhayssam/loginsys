import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsys/app/core/ui/loginsys_state.dart';
import 'package:loginsys/app/core/ui/widgets/loginsys_appbar.dart';
import 'package:loginsys/app/core/ui/widgets/loginsys_button.dart';
import 'package:loginsys/app/core/ui/widgets/loginsys_textformfield.dart';
import 'package:loginsys/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends LoginsysState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginsysAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Criar Conta',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Preencha o cadastro para criar a sua conta',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginsysTextformfield(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome Obrigatório'),
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginsysTextformfield(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Email Obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                    icon: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginsysTextformfield(
                    label: 'Senha',
                    controller: _passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha Obrigatória'),
                      Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres'),
                    ]),
                    icon: const Icon(Icons.lock),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginsysTextformfield(
                    label: 'Confirmar Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirmar Senha Obrigatória'),
                      Validatorless.compare(
                          _passwordEC, 'As senhas devem ser iguais'),
                    ]),
                    icon: const Icon(Icons.lock),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: LoginsysButton(
                      label: 'ENTRAR',
                      width: context.width,
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          controller.register(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            password: _passwordEC.text,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
