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
              width: constraints.maxWidth * .5,
              child: DropdownButtonFormField<ProjectStatus>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  contentPadding: const EdgeInsets.all(6),
                  isCollapsed: true,
                  isDense: true,
                ),
                items: ProjectStatus.values
                    .map(
                      (e) => DropdownMenuItem(
                        //enabled: false,
                        alignment: Alignment.center,
                        value: e,
                        child: Text(e.label),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
                // alignment: Alignment.topLeft
              ),
            ),
            SizedBox(
                width: constraints.maxWidth * .42,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(7),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      side: const BorderSide(style: BorderStyle.none)),
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
