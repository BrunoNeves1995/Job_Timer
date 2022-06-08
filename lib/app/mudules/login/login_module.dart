import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/mudules/login/controller/login_controller.dart';
import 'package:job_timer/app/mudules/login/login_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    // 1º se o nosso bind é um bloc nao podemos usar bind e sim BlocBind
    BlocBind.lazySingleton((i) => LoginController(authService: i())) //* i() AuthService AppModule
  ];

  @override
  final List<ModularRoute> routes = [
    // 1º Modular.get() -> busca uma instancia de controller la do modular
    ChildRoute(Modular.initialRoute,
        child: (context, args) => LoginPage(controller: Modular.get())),
    
  ];
}
