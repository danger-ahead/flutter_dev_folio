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
        navBarBtn(context, WhatIdo.route, ' 01. ', 'What I Do'),
        navBarBtn(context, Education.route, ' 02. ', 'Education'),
        navBarBtn(context, Experience.route, ' 03. ', 'Experience'),
        navBarBtn(context, Projects.route, ' 04. ', 'Projects'),
        navBarBtn(context, Achievements.route, ' 05. ', 'Achievements'),
        Visibility(
          visible: widget.isDarkModeBtnVisible,
          child: ThemeButton(),
        )
      ],
    );
  }
}
