import 'package:flutter/material.dart';

import 'app.dart';
import 'src/configure_web.dart';
import 'src/json_service.dart';
import 'src/theme/config.dart';
import 'src/theme/custom_theme.dart';

void main() {
  configureApp();
  runApp(const MyApp());
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
    jsonService.init();
    jsonService.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return JSONService.hasLoaded == true
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,
            themeMode: currentTheme.currentTheme,
            // routes: {
            //   '/': (BuildContext context) => const App(),
            //   '/home': (BuildContext context) => const HomePage(),
            //   '/experience': (BuildContext context) => Experience(),
            //   '/projects': (BuildContext context) => Projects(),
            //   '/achievements': (BuildContext context) => Achievements(),
            //   '/what_i_do': (BuildContext context) => WhatIdo(),
            //   '/contact_me': (BuildContext context) => const ContactMe(),
            //   '/education': (BuildContext context) => Education(),
            // },
            // initialRoute: '/',
            home: const App(),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
