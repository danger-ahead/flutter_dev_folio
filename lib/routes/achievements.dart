import 'package:flutter_dev_folio/src/achievements/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/routes/common_nav_bar.dart';
import 'package:flutter_dev_folio/src/achievements/data.dart';

class Achievements extends StatelessWidget {
  static const String route = '/achievements';
  Achievements({Key? key}) : super(key: key);

  final data = achievements();

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Column(children: [
      CommonNavBar(
        height: height,
        route: route,
      ),
      Expanded(
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 1000) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(data.length, (i) {
                  return Container(
                    padding:
                        EdgeInsets.fromLTRB(30.0, 0.0, 30.0, height * 0.05),
                    child: AchievementsCard(
                      height: height,
                      width: width,
                      desc: data[i][0],
                      link: data[i][1],
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
                  data.length % 3 == 0
                      ? data.length ~/ 3
                      : data.length ~/ 3 + 1,
                  (i) => Padding(
                    padding: EdgeInsets.only(bottom: width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          (data.length - storage - 1) >= 3
                              ? 3
                              : data.length - storage - 1, (index) {
                        storage = index + i * 3;
                        return AchievementsCard(
                          height: height,
                          width: width,
                          desc: data[index + i * 3][0],
                          link: data[index + i * 3][1],
                          isMobile: false,
                        );
                      }),
                    ),
                  ),
                ),
              ),
            );
          }
        }),
      )
    ]));
  }
}
