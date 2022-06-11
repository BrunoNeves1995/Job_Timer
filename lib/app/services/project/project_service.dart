import 'package:job_timer/app/entities/project_status.dart';

import '../../view_models/project_view_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectViewModel project);
  Future<List<ProjectViewModel>> findByStatus(ProjectStatus projectStatus);
}
