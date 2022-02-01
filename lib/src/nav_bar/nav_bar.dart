import 'package:flutter/material.dart';

import '../theme/theme_button.dart';
import 'nav_bar_btn.dart';

//The top Nav Bar
class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.isDarkModeBtnVisible,
  }) : super(key: key);

  final bool isDarkModeBtnVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          UnderlinedButton(
              context: context,
              tabNumber: 0,
              btnNumber: ' 00. ',
              btnName: 'Home'),
          UnderlinedButton(
              context: context,
              tabNumber: 1,
              btnNumber: ' 01. ',
              btnName: 'What I Do'),
          UnderlinedButton(
              context: context,
              tabNumber: 2,
              btnNumber: ' 02. ',
              btnName: 'Education'),
          UnderlinedButton(
              context: context,
              tabNumber: 3,
              btnNumber: ' 03. ',
              btnName: 'Experience'),
          UnderlinedButton(
              context: context,
              tabNumber: 4,
              btnNumber: ' 04. ',
              btnName: 'Projects'),
          UnderlinedButton(
              context: context,
              tabNumber: 5,
              btnNumber: ' 05. ',
              btnName: 'Achievements'),
          UnderlinedButton(
              context: context,
              tabNumber: 6,
              btnNumber: ' 06. ',
              btnName: 'Contact Me'),
          Visibility(
            visible: isDarkModeBtnVisible,
            child: const ThemeButton(),
          )
        ],
      ),
    );
  }
}
