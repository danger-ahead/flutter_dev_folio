import 'package:flutter_dev_folio/routes/education.dart';
import 'package:flutter_dev_folio/routes/what_i_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/src/theme/theme_button.dart';
import 'package:flutter_dev_folio/src/home/nav_bar_btn.dart';
import 'package:flutter_dev_folio/routes/achievements.dart';
import 'package:flutter_dev_folio/routes/experience.dart';
import 'package:flutter_dev_folio/routes/projects.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
    required this.isDarkModeBtnVisible,
  }) : super(key: key);

  final bool isDarkModeBtnVisible;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool lightMode = false;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        UnderlinedButton(
            context: context,
            routeName: WhatIdo.route,
            btnNumber: ' 01. ',
            btnName: 'What I Do'),
        UnderlinedButton(
            context: context,
            routeName: Education.route,
            btnNumber: ' 02. ',
            btnName: 'Education'),
        UnderlinedButton(
            context: context,
            routeName: Experience.route,
            btnNumber: ' 03. ',
            btnName: 'Experience'),
        UnderlinedButton(
            context: context,
            routeName: Projects.route,
            btnNumber: ' 04. ',
            btnName: 'Projects'),
        UnderlinedButton(
            context: context,
            routeName: Achievements.route,
            btnNumber: ' 05. ',
            btnName: 'Achievements'),
        Visibility(
          visible: widget.isDarkModeBtnVisible,
          child: ThemeButton(),
        )
      ],
    );
  }
}
