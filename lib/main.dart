import 'package:flutter/material.dart';
import 'gallery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      home: Material(
        child: Center(
          child: Gallery(),
        ),
      ),
    );
  }
}