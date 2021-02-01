import 'package:flutter/material.dart';

import 'pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Project',
      home: HomePage(),
    );
  }
}
