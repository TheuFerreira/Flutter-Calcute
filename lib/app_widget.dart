import 'package:flutter/material.dart';
import 'package:flutter_calculadora_rosa/app/pages/default/default_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcute',
      theme: ThemeData(fontFamily: 'Glory'),
      home: const DefaultPage(),
    );
  }
}
