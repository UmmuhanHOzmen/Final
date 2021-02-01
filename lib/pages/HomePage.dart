import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Başlık'),
        leading: GestureDetector(
          onTap: () {
            print('menuye tıklandı');
          },
          child: Icon(
            Icons.menu, // add custom icons also
          ),
        ),
      ),
      body: Column(),
    );
  }
}
