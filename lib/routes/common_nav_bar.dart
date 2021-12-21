import 'package:flutter/material.dart';

import '../src/custom/text_style.dart';
import '../src/theme/theme_button.dart';

class CommonNavBar extends StatelessWidget {
  const CommonNavBar({Key? key, required this.height, required this.route})
      : super(key: key);

  final double height;
  final String route;

  @override
  Widget build(BuildContext context) {
    String title = route.split('/')[1];
    title = title.replaceAll('_', ' ').toUpperCase();
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: height - height * 0.95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: Theme.of(context).primaryColorLight,
              icon: const Icon(Icons.home_filled),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            text(title, 12, Theme.of(context).primaryColorLight),
            const ThemeButton(),
          ],
        ),
      ),
    );
  }
}
