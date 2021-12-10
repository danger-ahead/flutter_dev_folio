import 'package:flutter_dev_folio/src/custom/text_style.dart';
import 'package:flutter_dev_folio/src/theme/config.dart';
import 'package:flutter/material.dart';

class EducationMobileCard extends StatelessWidget {
  const EducationMobileCard(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(
          top: height * 0.04,
          left: width * 0.015,
          right: width * 0.015,
          bottom: height * 0.04),
      width: width,
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/education/' + image,
                    scale: 1.2,
                  )),
            ),
            FittedBox(
                fit: BoxFit.cover, child: text(insttution, 25, Colors.white)),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: FittedBox(
                  fit: BoxFit.cover, child: text(location, 10, Colors.white)),
            ),
            FittedBox(
                fit: BoxFit.cover,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 11.0),
                  child: text(years != '' ? 'Years of study: ' + years : '', 12,
                      Colors.white),
                )),
            FittedBox(fit: BoxFit.cover, child: text(desc, 15, Colors.white)),
            FittedBox(
                fit: BoxFit.cover,
                child: text(grades != '' ? 'Grades Achieved: ' + grades : '',
                    12, Colors.white)),
          ],
        ),
      ),
    );
  }
}
