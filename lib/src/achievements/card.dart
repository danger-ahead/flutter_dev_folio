import 'package:flutter/material.dart';

import '../custom/text_style.dart';
import '../html_open_link.dart';
import '../theme/config.dart';

class AchievementsCard extends StatefulWidget {
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
  _AchievementsCardState createState() => _AchievementsCardState();
}

class _AchievementsCardState extends State<AchievementsCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
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
          top: isHover ? widget.height * 0.005 : widget.height * 0.01,
          bottom: !isHover ? widget.height * 0.005 : widget.height * 0.01),
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
              top: widget.height * 0.04,
              left: widget.width * 0.015,
              right: widget.width * 0.015,
              bottom: widget.height * 0.04),
          width: !widget.isMobile ? widget.width * 0.28 : widget.width,
          height:
              !widget.isMobile ? widget.height * 0.35 : widget.height / 2.25,
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
                  child: text(widget.desc, 18, Colors.white))),
        ),
      ),
    );
  }
}
