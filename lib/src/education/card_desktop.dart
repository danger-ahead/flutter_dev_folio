import 'package:flutter_dev_folio/src/custom/text_style.dart';
import 'package:flutter_dev_folio/src/theme/config.dart';
import 'package:flutter/material.dart';

class EducationDesktopCard extends StatefulWidget {
  const EducationDesktopCard(
      {Key? key,
      required this.height,
      required this.width,
      required this.insttution,
      required this.location,
      required this.desc,
      required this.grades,
      required this.years,
      required this.image})
      : super(key: key);

  final double height, width;
  final String insttution, location, years, grades, desc, image;
  _EducationDesktopCardState createState() => _EducationDesktopCardState();
}

class _EducationDesktopCardState extends State<EducationDesktopCard> {
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
              top: widget.height * 0.04,
              left: widget.width * 0.015,
              right: widget.width * 0.015,
              bottom: widget.height * 0.04),
          width: widget.width / 1.15,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isHover ? Colors.black12 : Colors.black45,
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/education/' + widget.image,
                      scale: 1.2,
                    )),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FittedBox(
                        fit: BoxFit.cover,
                        child: text(widget.insttution, 25, Colors.white)),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: text(widget.location, 10, Colors.white)),
                    ),
                    FittedBox(
                        fit: BoxFit.cover,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 11.0),
                          child: text(
                              widget.years != ''
                                  ? 'Years of study: ' + widget.years
                                  : '',
                              12,
                              Colors.white),
                        )),
                    FittedBox(
                        fit: BoxFit.cover,
                        child: text(widget.desc, 15, Colors.white)),
                    FittedBox(
                        fit: BoxFit.cover,
                        child: text(
                            widget.grades != ''
                                ? 'Grades Achieved: ' + widget.grades
                                : '',
                            12,
                            Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
