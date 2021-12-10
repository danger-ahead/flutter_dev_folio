import 'package:flutter_dev_folio/src/contact_me/my_bio.dart';
import 'package:flutter_dev_folio/src/home/social_media_bar.dart';
import 'package:flutter_dev_folio/src/htmlOpenLink.dart';
import 'package:flutter_dev_folio/src/theme/config.dart';
import 'package:flutter_dev_folio/src/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/routes/common_nav_bar.dart';
import 'package:flutter_dev_folio/src/contact_me/data.dart';
import 'package:flutter_dev_folio/src/custom/text_style.dart';

class ContactMe extends StatelessWidget {
  static const String route = '/contact_me';
  const ContactMe({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          CommonNavBar(
            height: height,
            route: route,
          ),
          Expanded(
            child: FutureBuilder(
                future: contactMe(),
                builder: (context, snapshot) {
                  if (snapshot.data == null)
                    return Center();
                  else {
                    var data = snapshot.data as List<String>;
                    return LayoutBuilder(builder: (context, constraints) {
                      if (constraints.maxWidth < 1000) {
                        return Center(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  text('Reach Out to me!', 35,
                                      Theme.of(context).primaryColorLight),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 7,
                                              color: CustomTheme
                                                  .darkTheme.cardColor,
                                            )),
                                        child: ClipOval(
                                            child: data[2] != ''
                                                ? Image.asset(
                                                    'assets/contact_me/' +
                                                        data[2],
                                                    scale: 2.7)
                                                : Image.asset(
                                                    'assets/contact_me/constant/picture.png',
                                                    scale: 2.7))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: text(
                                        'DISCUSS A PROJECT OR JUST WANT TO SAY HI? MY INBOX IS OPEN FOR ALL.',
                                        18,
                                        Theme.of(context)
                                            .primaryColorLight
                                            .withOpacity(0.7)),
                                  ),
                                  MyBio(fontSize: 15),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 8.0,
                                      top: 5.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        data[0] != ''
                                            ? Image.asset(
                                                currentTheme.currentTheme ==
                                                        ThemeMode.dark
                                                    ? 'assets/contact_me/constant/location-dark.png'
                                                    : 'assets/contact_me/constant/location.png',
                                                scale: 4)
                                            : Center(),
                                        text(
                                            ' ' + data[0],
                                            18,
                                            Theme.of(context)
                                                .primaryColorLight),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 13.0,
                                      top: 5.0,
                                    ),
                                    child: data[1] != ''
                                        ? text(
                                            'Open for opportunities: ' +
                                                data[1],
                                            18,
                                            Theme.of(context).primaryColorLight)
                                        : Center(),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    child: SocialMediaBar(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: width / 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      text('Reach Out to me!', 35,
                                          Theme.of(context).primaryColorLight),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: text(
                                            'DISCUSS A PROJECT OR JUST WANT TO SAY HI? MY INBOX IS OPEN FOR ALL.',
                                            18,
                                            Theme.of(context)
                                                .primaryColorLight
                                                .withOpacity(0.7)),
                                      ),
                                      MyBio(fontSize: 15),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: Row(
                                          children: [
                                            data[0] != ''
                                                ? Image.asset(
                                                    currentTheme.currentTheme ==
                                                            ThemeMode.dark
                                                        ? 'assets/contact_me/constant/location-dark.png'
                                                        : 'assets/contact_me/constant/location.png',
                                                    scale: 4)
                                                : Center(),
                                            text(
                                                ' ' + data[0],
                                                18,
                                                Theme.of(context)
                                                    .primaryColorLight),
                                          ],
                                        ),
                                      ),
                                      data[1] != ''
                                          ? text(
                                              'Open for opportunities: ' +
                                                  data[1],
                                              18,
                                              Theme.of(context)
                                                  .primaryColorLight)
                                          : Center(),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 7,
                                              color: CustomTheme
                                                  .darkTheme.cardColor,
                                            )),
                                        child: ClipOval(
                                            child: data[2] != ''
                                                ? Image.asset(
                                                    'assets/contact_me/' +
                                                        data[2],
                                                    scale: 2.5)
                                                : Image.asset(
                                                    'assets/contact_me/constant/picture.png',
                                                    scale: 2.5))),
                                    SocialMediaBar(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    });
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Column(
              children: [
                FutureBuilder(
                    future: nameAndLink(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data as List<String>;
                        return TextButton(
                          onPressed: () => htmlOpenLink(data[1]),
                          child: text('Made with ❤️ by ' + data[0], 10,
                              Theme.of(context).primaryColorLight),
                        );
                      }
                      return Center();
                    }),
                TextButton(
                  onPressed: () => htmlOpenLink(
                      'https://github.com/danger-ahead/flutter_dev_folio'),
                  child: text('Theme by flutter_dev_folio', 10,
                      Theme.of(context).primaryColorLight),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
