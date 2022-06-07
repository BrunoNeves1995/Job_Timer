import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/mudules/login/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const LoginPage()),
    
  ];
}
