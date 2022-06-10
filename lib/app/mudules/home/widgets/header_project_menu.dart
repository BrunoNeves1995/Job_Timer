import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/entities/project_status.dart';

class HeaderProjectMenu extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        height: constraints.maxHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: constraints.maxWidth * .45,
              child: DropdownButtonFormField<ProjectStatus>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  contentPadding: const EdgeInsets.all(10),
                  isCollapsed: true,
                ),
                items: ProjectStatus.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.label),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
                width: constraints.maxWidth * .42,
                child: ElevatedButton.icon(
                  label: const Text('Novo Projetos'),
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Modular.to.pushNamed('/project/register/');
                  },
                )),
          ],
        ),
      );
    });
  }

  // tamanho maximo que ele pode se estender
  @override
  double get maxExtent => 80.0;

  // minimo que ele pode ele deve ficar
  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
