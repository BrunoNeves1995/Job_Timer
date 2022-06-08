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

    // 3º pegando a credencial e passando os parametros
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // 4º fazer o login no firebase
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    // 1º Deslogando o usuario do farebase
    await FirebaseAuth.instance.signOut();

    // 2º faz com que abra a janela de login novamente do google
    await GoogleSignIn().disconnect();
  }
}
