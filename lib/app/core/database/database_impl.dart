import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:path_provider/path_provider.dart';

import '../../entities/project.dart';
import './database.dart';

class DatabaseImpl implements Database {
   Isar? _databaseInstance;
  // 1º abrir nossa conexão
  @override
  Future<Isar> openConnection() async {
    // 2º sempre que for abrir uma conexão, ele verifica se ja tem uma conexão aberta e retorna

    if (_databaseInstance == null) {
      // 3º pegando o diretorio onde esta o banco de dados
      final dir = await getApplicationSupportDirectory();

      // 4º criando o database
      _databaseInstance = await Isar.open(
        schemas: [ProjectTaskSchema, ProjectSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return _databaseInstance!;
  }
}
