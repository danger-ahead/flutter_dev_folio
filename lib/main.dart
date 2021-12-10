import 'package:flutter_dev_folio/routes/contact_me.dart';
import 'package:flutter_dev_folio/routes/education.dart';
import 'package:flutter_dev_folio/routes/what_i_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/routes/home.dart';
import 'package:flutter_dev_folio/routes/experience.dart';
import 'package:flutter_dev_folio/routes/projects.dart';
import 'package:flutter_dev_folio/routes/achievements.dart';
import 'package:flutter_dev_folio/src/theme/custom_theme.dart';
import 'package:flutter_dev_folio/src/theme/config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meet Shourya',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      routes: {
        '/': (context) => HomePage(),
        '/experience': (context) => Experience(),
        '/projects': (context) => Projects(),
        '/achievements': (context) => Achievements(),
        '/what_i_do': (context) => WhatIdo(),
        '/contact_me': (context) => ContactMe(),
        '/education': (context) => Education(),
      },
    );
  }
}
