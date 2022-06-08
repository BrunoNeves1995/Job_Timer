part of 'login_controller.dart';

// 1º estado inicial e estatus que a tela de login vai passar
enum LoginStatus { initial, loader, failure }

class LoginState extends Equatable {
  // 2º dentro desse estado, que é o cara que vai ser enviado para nosssa tela
  final LoginStatus status;
  final String? errorMessage;

  const LoginState._({
    required this.status,
    this.errorMessage,
  });

  // 2º criando um construtor nomeado, onde acessamos o construtor privado passando o estado inicial
  const LoginState.initial() : this._(status: LoginStatus.initial);
  

  // Equatable -> cria meu equal == dos atributos
  @override
  List<Object?> get props => [status, errorMessage];



  // copyWith -> faz uma copia da instancia dessa classe
  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
  }) {
    return  LoginState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
