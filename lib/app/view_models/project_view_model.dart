import 'package:job_timer/app/entities/project_status.dart';

import '../entities/project.dart';
import 'project_task_model.dart';

class ProjectViewModel {
  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> taks;

  ProjectViewModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.taks,
  });

  factory ProjectViewModel.fromEntity(Project project) {
    project.tasks.loadSync();
    return ProjectViewModel(
        id: project.id,
        name: project.name,
        estimate: project.estimate,
        status: project.status,
        taks: project.tasks.map(ProjectTaskModel.fromEntity).toList());
  }
}
