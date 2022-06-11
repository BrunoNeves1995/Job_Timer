import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job_timer/app/entities/project_status.dart';
import '../../../../services/project/project_service.dart';
import '../../../../view_models/project_view_model.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterState> {
  final ProjectService _projectService;
  ProjectRegisterController({
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(ProjectRegisterState.initial);

  Future<void> register(String name, int estimate) async {
    try {
      emit(ProjectRegisterState.loader);
      final projectViewModel = ProjectViewModel(
        name: name,
        estimate: estimate,
        status: ProjectStatus.em_andamento,
        taks: [],
        id: null,
      );
      await _projectService.register(projectViewModel);
      emit(ProjectRegisterState.success);
    } catch (e, s) {
      log('Erro ao Criar novo projeto', error: e, stackTrace: s);
      emit(ProjectRegisterState.failure);
    }
  }
}
// 1º entra na tela ->  estado inicial


// 2º clicar em salvar -> estado de loader


// 3º clicar em salvar -> estado de sucesso

// 4º clicar em salvar -> estado de failure
