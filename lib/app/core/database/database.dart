import 'package:isar/isar.dart';

abstract class Database {
  // 1º abrir nossa conexão
  Future<Isar> openConnection();
}
