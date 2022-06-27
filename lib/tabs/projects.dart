import 'package:flutter/material.dart';

import '../src/nav_bar/title_bar.dart';
import '../src/projects/card.dart';
import '../src/projects/data.dart';

class Projects extends StatelessWidget {
  Projects({Key? key}) : super(key: key);

  final List<List<String>> data = projects();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(children: [
      TitleBar(height: height, width: width, title: 'PROJECTS'),
      Padding(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 1000) {
            return Column(
              children: List.generate(data.length, (int i) {
                return Container(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, height * 0.05),
                  child: ProjectsCard(
                    title: data[i][0],
                    techStack: data[i][1],
                    desc: data[i][2],
                    link: data[i][3],
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
                      return ProjectsCard(
                        title: data[index + i * 3][0],
                        techStack: data[index + i * 3][1],
                        desc: data[index + i * 3][2],
                        link: data[index + i * 3][3],
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
