import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import '../html_open_link.dart';
import '../theme/config.dart';

class AchievementsCard extends StatefulWidget {
  const AchievementsCard(
      {Key? key,
      required this.desc,
      required this.isMobile,
      required this.link})
      : super(key: key);

  final String desc, link;
  final bool isMobile;
  @override
  _AchievementsCardState createState() => _AchievementsCardState();
}

class _AchievementsCardState extends State<AchievementsCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isHover ? Colors.black12 : Colors.black45,
            blurRadius: 10.0,
            offset: const Offset(8, 12),
          )
        ],
      ),
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
          top: isHover ? height * 0.005 : height * 0.01,
          bottom: !isHover ? height * 0.005 : height * 0.01),
      child: InkWell(
        onHover: (bool value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: () => htmlOpenLink(widget.link),
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
              top: height * 0.04,
              left: width * 0.015,
              right: width * 0.015,
              bottom: height * 0.04),
          width: !widget.isMobile ? width * 0.28 : width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isHover ? Colors.black12 : Colors.black45,
                blurRadius: 10.0,
                offset: const Offset(8, 12),
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
              child: SingleChildScrollView(
                  child: CustomText(
                      text: widget.desc, fontSize: 18, color: Colors.white))),
        ),
      ),
    );
  }
}
