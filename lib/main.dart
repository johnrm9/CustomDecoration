import 'package:flutter/material.dart';

import 'pages/sunny_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String title = 'Custom Decoration Demo';
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          iconTheme: const IconThemeData(size: 90, color: Colors.orange),
        ),
        home: const SunnyHomePage(),
      );
}
