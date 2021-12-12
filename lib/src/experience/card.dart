import 'package:flutter_dev_folio/src/custom/text_style.dart';
import 'package:flutter_dev_folio/src/theme/config.dart';
import 'package:flutter/material.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard(
      {Key? key,
      required this.height,
      required this.width,
      required this.image,
      required this.title,
      required this.desc,
      required this.period,
      required this.role,
      required this.isMobile})
      : super(key: key);

  final double height, width;
  final String image, title, desc, period, role;
  final bool isMobile;

  _ExperienceCardState createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isHover ? Colors.black12 : Colors.black45,
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(8, 12),
          )
        ],
      ),
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.only(
          top: (isHover) ? widget.height * 0.005 : widget.height * 0.01,
          bottom: !(isHover) ? widget.height * 0.005 : widget.height * 0.01),
      child: InkWell(
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: () {},
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
            top: 5.0,
          ),
          width: !widget.isMobile ? widget.width * 0.28 : widget.width,
          height: widget.height * 0.55,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isHover ? Colors.black12 : Colors.black45,
                blurRadius: 10.0,
                spreadRadius: 0.0,
                offset: Offset(8, 12),
              )
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(
              5.0,
            ),
            border: Border.all(
              width: 3,
              color: currentTheme.currentTheme == ThemeMode.dark
                  ? Theme.of(context).cardColor
                  : Theme.of(context).primaryColor,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/experience/' + widget.image,
                  scale: 1.1,
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                    top: widget.height * 0.04,
                    left: widget.width * 0.015,
                    right: widget.width * 0.01,
                    bottom: widget.height * 0.04),
                width: !widget.isMobile ? widget.width * 0.28 : widget.width,
                height: widget.height * 0.35,
                decoration: BoxDecoration(
                  color: currentTheme.currentTheme == ThemeMode.dark
                      ? Theme.of(context).cardColor
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        FittedBox(
                            fit: BoxFit.cover,
                            child: text(widget.title, 25, Colors.white)),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 5.0, bottom: 16.0),
                          child: FittedBox(
                              fit: BoxFit.cover,
                              child: text(widget.role, 14, Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: FittedBox(
                              fit: BoxFit.cover,
                              child: text(widget.period, 15, Colors.white)),
                        ),
                        text(widget.desc, 15, Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
