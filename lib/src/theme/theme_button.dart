import 'package:flutter_dev_folio/src/theme/config.dart';
import 'package:flutter/material.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({Key? key}) : super(key: key);
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
          ? Icon(Icons.wb_sunny)
          : Icon(Icons.nightlight),
    );
  }
}
