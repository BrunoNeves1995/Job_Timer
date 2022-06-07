import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<void> signIn() async {
    // 1º abrindo a tela para escolher nosso email
    final googleUser = await GoogleSignIn().signIn();

    // 2º obter os detalhes da nossa conexão
    final googleAuth = await googleUser?.authentication;

    // 3º pegando a credencial
    final credential = googleAuth?.idToken;
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
