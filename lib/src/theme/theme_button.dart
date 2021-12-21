import 'package:flutter/material.dart';

import 'config.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({Key? key}) : super(key: key);
  @override
  ThemeButtonState createState() => ThemeButtonState();
}

class ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      color: Theme.of(context).primaryColorLight,
      onPressed: () {
        currentTheme.toggleTheme();
        setState(() {});
      },
      icon: currentTheme.currentTheme == ThemeMode.dark
          ? const Icon(Icons.wb_sunny)
          : const Icon(Icons.nightlight),
    );
  }
}
