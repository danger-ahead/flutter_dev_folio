import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'src/nav_bar/nav_bar.dart';
import 'src/theme/theme_button.dart';
import 'tabs/tabs.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1000) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: const ThemeButton(),
          ),
          body: ScrollablePositionedList.builder(
              physics: const BouncingScrollPhysics(),
              minCacheExtent: double.infinity,
              shrinkWrap: true,
              itemCount: 7,
              itemScrollController: scroll,
              itemBuilder: (context, index) {
                return widgetList[index];
              }),
        );
      } else {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(width, height * 0.07),
              child: const NavBar(isDarkModeBtnVisible: true)),
          body: ScrollablePositionedList.builder(
              physics: const BouncingScrollPhysics(),
              minCacheExtent: double.infinity,
              shrinkWrap: true,
              itemCount: 7,
              itemScrollController: scroll,
              itemBuilder: (context, index) {
                return widgetList[index];
              }),
        );
      }
    });
  }
}
