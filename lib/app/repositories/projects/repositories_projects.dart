import 'package:job_timer/app/entities/project_status.dart';

import '../../entities/project.dart';

abstract class RepositoriesProjects {
  Future<void> register(Project project);
  Future<List<Project>> findbyStatus(ProjectStatus projectStatus);
}
