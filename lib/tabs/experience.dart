import 'package:flutter/material.dart';

import '../src/experience/card.dart';
import '../src/experience/data.dart';
import '../src/nav_bar/title_bar.dart';

class Experience extends StatelessWidget {
  Experience({Key? key}) : super(key: key);

  final List<List<String>> data = experience();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(children: [
      TitleBar(height: height, width: width, title: 'EXPERIENCE'),
      Padding(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 1000) {
            return Column(
              children: List.generate(data.length, (int i) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: height * 0.05),
                  child: ExperienceCard(
                    image: data[i][4],
                    title: data[i][0],
                    role: data[i][1],
                    period: data[i][2],
                    desc: data[i][3],
                    isMobile: true,
                  ),
                );
              }),
            );
          } else {
            int storage = -1;
            return Column(
              children: List.generate(
                data.length % 3 == 0 ? data.length ~/ 3 : data.length ~/ 3 + 1,
                (int i) => Padding(
                  padding: EdgeInsets.only(bottom: width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        (data.length - storage - 1) >= 3
                            ? 3
                            : data.length - storage - 1, (int index) {
                      storage = index + i * 3;
                      return ExperienceCard(
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
            );
          }
        }),
      )
    ]);
  }
}
