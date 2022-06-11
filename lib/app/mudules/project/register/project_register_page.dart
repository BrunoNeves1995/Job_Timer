import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/core_ui_loader.dart';
import 'package:job_timer/app/mudules/project/register/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;
  const ProjectRegisterPage({super.key, required this.controller});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _estimateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterState>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterState.success:
            Modular.to.pop(context);
            break;
          case ProjectRegisterState.failure:
            AsukaSnackbar.alert('Erro ao Salvar novo projeto').show();
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text(
            'Criar novo projeto',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                      controller: _nameEC,
                      decoration: const InputDecoration(
                        label: Text('Nome do projeto'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          // borderSide: BorderSide.none,
                        ),
                      ),
                      validator: Validatorless.required('Nome obrigatório')),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _estimateEC,
                    decoration: const InputDecoration(
                      label: Text('Estimativa de horas'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        // borderSide: BorderSide.none,
                      ),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required('Horas obrigatória'),
                      Validatorless.number('Permitido somente numeros'),
                    ]),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  BlocSelector<ProjectRegisterController, ProjectRegisterState,
                      bool>(
                    bloc: widget.controller,
                    selector: (state) => state == ProjectRegisterState.loader,
                    builder: (context, showLoader) {
                      return Visibility(
                        visible: showLoader,
                        child: const CoreUiLoader(),
                      );
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    height: 49.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          final name = _nameEC.text;
                          final estimate = int?.tryParse(_estimateEC.text) ?? 0;
                          await widget.controller.register(name, estimate);
                        }
                      },
                      child: const Text('Salvar'),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
