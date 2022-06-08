import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/mudules/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  //! recebendo a controller no construtor
  final LoginController controller;
  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocListener<LoginController, LoginState>(
      bloc: controller,
      // listenWhen -> se meu esttus anterior for diferente do novo, executamoso  (listener)
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == LoginStatus.failure) {
          final message = state.errorMessage ?? 'Erro ao realizar login';
          AsukaSnackbar.alert(message).show();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0092B9),
                Color(0xFF0165B1),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(height: screenSize.height * .1),
                SizedBox(
                  width: screenSize.width * .8,
                  height: 49,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shadowColor: const Color(0xFF0066B0),
                    ),
                    child: Image.asset('assets/images/google.png'),
                    onPressed: () {
                      // 1º quando eu clicar no botão chama minha classe de service para fazer o login
                      controller.signIn();
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                // 2º extraimos do status 1 valor e retornamos outro
                BlocSelector<LoginController, LoginState, bool>(
                  bloc: controller,
                  selector: (state) => state.status == LoginStatus.loader,
                  builder: (context, showLoader) {
                    return Visibility(
                      // Visibility -> se for true ele mostra de nao for ele nao mostra
                      visible: showLoader,
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
