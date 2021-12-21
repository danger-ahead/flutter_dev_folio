import 'package:flutter/material.dart';

import '../src/contact_me/contact_me_button.dart';
import '../src/home/about.dart';
import '../src/home/designation.dart';
import '../src/home/introduction.dart';
import '../src/home/my_name.dart';
import '../src/home/nav_bar.dart';
import '../src/home/resume.dart';
import '../src/home/social_media_bar.dart';
import '../src/theme/theme_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 1000) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.024),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.012),
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
                            setState(() {
                              menuVisible = !menuVisible;
                            });
                          },
                          child: menuVisible
                              ? const Icon(Icons.menu_open)
                              : const Icon(Icons.menu),
                        ),
                        const ThemeButton(),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: menuVisible,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: height * 0.029),
                      child: const NavBar(
                        isDarkModeBtnVisible: false,
                      ),
                    ),
                  ),
                  const Introduction(word: 'Hello,\nI am', textScaleFactor: 3),
                  MyName(
                    isMobile: true,
                    context: context,
                  ),
                  Designation(isMobile: true, context: context),
                  SocialMediaBar(
                    height: height,
                  ),
                  About(fontSize: 24),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.029),
                    child: OverflowBar(
                      children: [
                        Resume(
                          width: 0,
                        ),
                        ContactMeButton(),
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
                  padding: EdgeInsets.only(bottom: height * 0.1),
                  child: const NavBar(
                    isDarkModeBtnVisible: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.032),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Introduction(
                          word: 'Hello, I am', textScaleFactor: 3.5),
                      FittedBox(
                          fit: BoxFit.cover,
                          child: MyName(
                            isMobile: false,
                            context: context,
                          )),
                      Designation(isMobile: false, context: context),
                      SocialMediaBar(
                        height: height,
                      ),
                      About(fontSize: 30),
                      Padding(
                        padding: EdgeInsets.only(bottom: height * 0.026),
                        child: Row(
                          children: [
                            Resume(
                              width: width,
                            ),
                            ContactMeButton(),
                          ],
                        ),
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
