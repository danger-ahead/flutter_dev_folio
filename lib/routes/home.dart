import 'package:flutter_dev_folio/routes/education.dart';
import 'package:flutter_dev_folio/src/home/about.dart';
import 'package:flutter_dev_folio/src/home/resume.dart';
import 'package:flutter_dev_folio/src/home/social_media_bar.dart';
import 'package:flutter_dev_folio/src/theme/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/src/home/designation.dart';
import 'package:flutter_dev_folio/src/home/introduction.dart';
import 'package:flutter_dev_folio/src/home/my_name.dart';
import 'package:flutter_dev_folio/src/home/nav_bar.dart';
import 'package:flutter_dev_folio/src/custom/text_style.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  bool menuVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            overlayColor: MaterialStateProperty.all(
                                Theme.of(context).hoverColor),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            foregroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                          ),
                          onPressed: () {
                            menuVisible = !menuVisible;
                            setState(() {});
                          },
                          child: menuVisible
                              ? Icon(Icons.menu_open)
                              : Icon(Icons.menu),
                        ),
                        ThemeButton(),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: menuVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: NavBar(
                        isDarkModeBtnVisible: false,
                      ),
                    ),
                  ),
                  Introduction(word: 'Hello,\nI am', textScaleFactor: 3),
                  MyName(
                    isMobile: true,
                    context: context,
                  ),
                  Designation(isMobile: true, context: context),
                  SocialMediaBar(),
                  About(fontSize: 24),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Row(
                      children: [
                        Resume(),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 20.0),
                          child: TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, Education.route),
                            child: text('EDUCATION', 20,
                                Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: NavBar(
                    isDarkModeBtnVisible: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Introduction(word: 'Hello, I am', textScaleFactor: 3.5),
                      FittedBox(
                          fit: BoxFit.cover,
                          child: MyName(
                            isMobile: false,
                            context: context,
                          )),
                      Designation(isMobile: false, context: context),
                      SocialMediaBar(),
                      About(fontSize: 30),
                      Row(
                        children: [
                          Resume(),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, bottom: 20.0),
                            child: TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, Education.route),
                              child: text('EDUCATION', 20,
                                  Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
