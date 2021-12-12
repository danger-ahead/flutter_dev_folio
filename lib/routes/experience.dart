import 'package:flutter_dev_folio/src/experience/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/routes/common_nav_bar.dart';
import 'package:flutter_dev_folio/src/experience/data.dart';

class Experience extends StatelessWidget {
  static const String route = '/experience';
  Experience({Key? key}) : super(key: key);

  final data = experience();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(children: [
      CommonNavBar(
        height: height,
        route: Experience.route,
      ),
      Expanded(child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(data.length, (i) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: height * 0.05),
                  child: ExperienceCard(
                    height: height,
                    width: width,
                    image: data[i][4],
                    title: data[i][0],
                    role: data[i][1],
                    period: data[i][2],
                    desc: data[i][3],
                    isMobile: true,
                  ),
                );
              }),
            ),
          );
        } else {
          int storage = -1;
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                data.length % 3 == 0 ? data.length ~/ 3 : data.length ~/ 3 + 1,
                (i) => Padding(
                  padding: EdgeInsets.only(bottom: width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        (data.length - storage - 1) >= 3
                            ? 3
                            : data.length - storage - 1, (index) {
                      storage = index + i * 3;
                      return ExperienceCard(
                        height: height,
                        width: width,
                        image: data[index + i * 3][4],
                        title: data[index + i * 3][0],
                        role: data[index + i * 3][1],
                        period: data[index + i * 3][2],
                        desc: data[index + i * 3][3],
                        isMobile: false,
                      );
                    }),
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
