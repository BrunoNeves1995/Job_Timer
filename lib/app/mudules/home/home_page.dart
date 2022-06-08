import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                final db = Modular.get<Database>();
                final conection = await db.openConnection();
               
                conection.writeTxn((isar) {
                  var project = Project();
                  project.name = 'projeto teste';
                  project.status = ProjectStatus.em_andamento;

                  return conection.projects.put(project);
                });
              },
              child: const Text('cadastrar'))
        ],
      ),
    );
  }
}
