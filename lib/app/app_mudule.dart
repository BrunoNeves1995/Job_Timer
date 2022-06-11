import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/database/database_impl.dart';
import 'package:job_timer/app/mudules/home/home_module.dart';
import 'package:job_timer/app/mudules/login/login_module.dart';
import 'package:job_timer/app/mudules/project/project_module.dart';
import 'package:job_timer/app/mudules/splash/splash_page.dart';
import 'package:job_timer/app/repositories/projects/repositories_projects.dart';
import 'package:job_timer/app/repositories/projects/repositories_projects_impl.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';
import 'package:job_timer/app/services/auth/auth_service_impl.dart';
import 'package:job_timer/app/services/project/project_service.dart';
import 'package:job_timer/app/services/project/project_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
        Bind.lazySingleton<Database>((i) => DatabaseImpl()),
        Bind.lazySingleton<RepositoriesProjects>((i) => RepositoriesProjectsImpl(database: i())),
        Bind.lazySingleton<ProjectService>((i) => ProjectServiceImpl(projectsRepository: i()))
       

      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/project', module: ProjectModule()),
      ];
}
