import 'package:flutter/material.dart';

class CoreUiLoader extends StatelessWidget {
  const CoreUiLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
      ),
    );
  }
}
