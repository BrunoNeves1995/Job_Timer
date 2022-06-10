import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/mudules/project/register/project_register_page.dart';

class ProjectRegisterModule extends Module {

   @override
   final List<Bind> binds = [];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(Modular.initialRoute, child: (context, args) => const ProjectRegisterPage())
   ];

}