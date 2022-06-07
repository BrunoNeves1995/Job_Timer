import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/mudules/home/home_page.dart';

class HomeModule extends Module {

   @override
   final List<Bind> binds = [];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(Modular.initialRoute, child: (context, args) => const HomePage())
   ];

}