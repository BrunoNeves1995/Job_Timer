import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/mudules/home/home_module.dart';
import 'package:job_timer/app/mudules/login/login_module.dart';
import 'package:job_timer/app/mudules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
