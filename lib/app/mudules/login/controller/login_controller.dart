import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';
part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  //! recebendo uma instancia de authService
  final AuthService _authService;

  // 1º temos um contrutor que recebe um parametro e passamos para o super nosso estado inicial
  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(const LoginState.initial());

  Future<void> signIn() async {
    try {
      // 2º emitimos um novo estado e mandamos para tela
      emit(state.copyWith(status: LoginStatus.loader));
      // 3º chamando o login do AuthService
      await _authService.signIn();
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      // 4º se deu algum erro, emitimos um novo estado
      emit(state.copyWith(
          status: LoginStatus.failure, errorMessage: 'Erro ao realizar login'));
    }
  }
}
