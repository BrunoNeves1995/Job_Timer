import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/exceptions/failure_exceptions.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/repositories/projects/repositories_projects.dart';

class RepositoriesProjectsImpl implements RepositoriesProjects {
  final Database _database;

  RepositoriesProjectsImpl({
    required Database database,
  }) : _database = database;
  @override
  Future<void> register(Project project) async {
    try {
      final conection = await _database.openConnection();
      await conection.writeTxn((isar) {
        return isar.projects.put(project);
      });
    } on IsarError catch (e, s) {
      log('Erro ao cadastrar projeto no banco', error: e, stackTrace: s);
      throw FailureExceptions(message: 'Erro ao cadastrar projeto');
    }
  }

  @override
  Future<List<Project>> findbyStatus(ProjectStatus projectStatus) async {
    final connection = await _database.openConnection();
     return await  connection.projects.filter().statusEqualTo(projectStatus).findAll();
  }
}
