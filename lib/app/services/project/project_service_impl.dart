import 'package:job_timer/app/entities/project_status.dart';

import '../../entities/project.dart';
import '../../repositories/projects/repositories_projects.dart';
import '../../view_models/project_view_model.dart';
import 'project_service.dart';

class ProjectServiceImpl implements ProjectService {
  final RepositoriesProjects _projectsRepository;

  ProjectServiceImpl({
    required RepositoriesProjects projectsRepository,
  }) : _projectsRepository = projectsRepository;
  @override
  Future<void> register(ProjectViewModel projectViewModel) async {
    final project = Project()
      ..id = projectViewModel.id
      ..name = projectViewModel.name
      ..status = projectViewModel.status
      ..estimate = projectViewModel.estimate;
    await _projectsRepository.register(project);
  }

  @override
  Future<List<ProjectViewModel>> findByStatus(
      ProjectStatus projectStatus) async {
    final projects = await _projectsRepository.findbyStatus(projectStatus);
    // mapenado
   return projects.map(ProjectViewModel.fromEntity).toList();
  }
}
