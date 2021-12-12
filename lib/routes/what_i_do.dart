import 'package:flutter_dev_folio/routes/common_nav_bar.dart';
import 'package:flutter_dev_folio/src/custom/text_style.dart';
import 'package:flutter_dev_folio/src/theme/config.dart';
import 'package:flutter_dev_folio/src/whatIDo/data.dart';
import 'package:flutter_dev_folio/src/whatIDo/progress.dart';
import 'package:flutter/material.dart';

class WhatIdo extends StatelessWidget {
  static const String route = '/what_i_do';
  WhatIdo({Key? key}) : super(key: key);

  final data = whatIdo();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(children: <Widget>[
      CommonNavBar(
        height: height,
        route: route,
      ),
      Expanded(child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          int storage = -1;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                child: text("⚡ I have a good proficiency in:", 15,
                    Theme.of(context).primaryColorLight),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 25.0,
                  left: 15.0,
                  right: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      currentTheme.currentTheme == ThemeMode.dark
                          ? 'assets/what_i_do/constant/checklist.png'
                          : 'assets/what_i_do/constant/checklist-light.png',
                      scale: 2,
                    ),
                    Column(
                      children: List.generate(
                        data[0].length,
                        (index) => Progress(
                          width: width / 1.55,
                          widthSecondContainer:
                              double.parse(data[0][index].split("--")[1]),
                          title: data[0][index].split("--")[0],
                          sizeProficiencyName: 12,
                          sizePercentage: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                child: text(
                    data[1].length != 0
                        ? "⚡ Some languages & tools I use:"
                        : "",
                    15,
                    Theme.of(context).primaryColorLight),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 20),
                child: Column(
                  children: List.generate(
                    data[1].length % 4 == 0
                        ? data[1].length ~/ 4
                        : data[1].length ~/ 4 + 1,
                    (i) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                            (data[1].length - storage - 1) >= 4
                                ? 4
                                : data[1].length - storage - 1, (index) {
                          storage = index + i * 4;
                          return Image.asset(
                            'assets/what_i_do/' + data[1][index + i * 4],
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          int storage = -1;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 10, 70, 20),
                child: text("⚡ I have a good proficiency in:", 35,
                    Theme.of(context).primaryColorLight),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: List.generate(
                        data[0].length,
                        (index) => Progress(
                          width: width / 2,
                          widthSecondContainer:
                              double.parse(data[0][index].split("--")[1]),
                          title: data[0][index].split("--")[0],
                          sizeProficiencyName: 22,
                          sizePercentage: 15,
                        ),
                      ),
                    ),
                    Image.asset(
                      currentTheme.currentTheme == ThemeMode.dark
                          ? 'assets/what_i_do/constant/checklist.png'
                          : 'assets/what_i_do/constant/checklist-light.png',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 30, 70, 20),
                child: text(
                    data[1].length != 0
                        ? "⚡ Some languages & tools I use:"
                        : "",
                    35,
                    Theme.of(context).primaryColorLight),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25.0,
                  bottom: 20.0,
                ),
                child: Column(
                  children: List.generate(
                    data[1].length % 8 == 0
                        ? data[1].length ~/ 8
                        : data[1].length ~/ 8 + 1,
                    (i) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            (data[1].length - storage - 1) >= 8
                                ? 8
                                : data[1].length - storage - 1, (index) {
                          storage = index + i * 8;
                          return Image.asset(
                            'assets/what_i_do/' + data[1][index + i * 8],
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      })))
    ]));
  }
}
