import 'package:flutter_dev_folio/routes/common_nav_bar.dart';
import 'package:flutter_dev_folio/src/education/card_desktop.dart';
import 'package:flutter_dev_folio/src/education/card_mobile.dart';
import 'package:flutter_dev_folio/src/education/data.dart';
import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  static const String route = '/education';
  Education({Key? key}) : super(key: key);

  final data = education();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(children: [
      CommonNavBar(
        height: height,
        route: route,
      ),
      Expanded(child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                data.length,
                (i) => Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: height * 0.05),
                  child: EducationMobileCard(
                    height: height,
                    width: width,
                    insttution: data[i][0],
                    location: data[i][1],
                    desc: data[i][3],
                    grades: data[i][4],
                    years: data[i][2],
                    image: data[i][5],
                  ),
                ),
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                data.length,
                (i) => Padding(
                  padding: EdgeInsets.only(bottom: height * 0.04),
                  child: EducationDesktopCard(
                    height: height,
                    width: width,
                    insttution: data[i][0],
                    location: data[i][1],
                    desc: data[i][3],
                    grades: data[i][4],
                    years: data[i][2],
                    image: data[i][5],
                  ),
                ),
              ),
            ),
          );
        }
      }))
    ]));
  }
}
