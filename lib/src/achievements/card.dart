import 'package:flutter_dev_folio/src/custom/text_style.dart';
import 'package:flutter_dev_folio/src/htmlOpenLink.dart';
import 'package:flutter_dev_folio/src/theme/config.dart';
import 'package:flutter/material.dart';

class AchievementsCard extends StatelessWidget {
  const AchievementsCard(
      {Key? key,
      required this.desc,
      required this.isMobile,
      required this.height,
      required this.width,
      required this.link})
      : super(key: key);

  final double height, width;
  final String desc, link;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => htmlOpenLink(link),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(
            top: height * 0.04,
            left: width * 0.015,
            right: width * 0.015,
            bottom: height * 0.04),
        width: !isMobile ? width * 0.28 : width,
        height: !isMobile ? height * 0.35 : height / 2.25,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: Offset(8, 12),
            )
          ],
          color: currentTheme.currentTheme == ThemeMode.dark
              ? Theme.of(context).cardColor
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
        child: Center(
            child: SingleChildScrollView(child: text(desc, 18, Colors.white))),
      ),
    );
  }
}
