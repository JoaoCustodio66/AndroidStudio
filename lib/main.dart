import 'dart:io';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pi3/COLORS.DART.dart';

import 'COLORS.DART.dart';
import 'homepage.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imagens',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: primary,
      ),
      home: const HomePage(),
    );
  }
}