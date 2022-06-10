import 'package:flutter/material.dart';

import 'widgets/header_project_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SafeArea(
          child: ListTile(
            title: Text('sair'),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Projeto'),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(20, 20),
                      bottomRight: Radius.elliptical(20, 20))),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectMenu(),
              pinned: true,
            ),
          ],
        ),
      ),
    );
  }
}
