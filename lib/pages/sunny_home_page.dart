import 'package:flutter/material.dart';

import '../widgets/custom_decoration.dart';

class SunnyHomePage extends StatelessWidget {
  const SunnyHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            width: 264,
            height: 360,
            decoration: const CustomDecoration(24),
            child: const Icon(Icons.wb_sunny),
          ),
        ),
      );
}
