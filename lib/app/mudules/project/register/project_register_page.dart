import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({Key? key}) : super(key: key);

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
    return Scaffold(
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
                    decoration: InputDecoration(
                      label: const Text('Nome do projeto'),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 49.0,
                  child: ElevatedButton(
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        log('valido');
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
