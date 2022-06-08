import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // listiner que vai ficar escutando alteração do usuario no firebase
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        log('Usuario esta logado');
        Modular.to.pushNamed('/home/');
      } else {
        log('Usuario não esta logado');
        Modular.to.pushNamed('/login/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0092B9),
              Color(0xFF0165B1),
            ],
            // begin: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
