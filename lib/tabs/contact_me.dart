import 'package:flutter/material.dart';

import '../src/contact_me/data.dart';
import '../src/contact_me/my_bio.dart';
import '../src/custom/custom_text.dart';
import '../src/home/social_media_bar.dart';
import '../src/html_open_link.dart';
import '../src/theme/config.dart';
import '../src/theme/custom_theme.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final List<String> data = contactMe();
  final List<String> getNameAndLink = nameAndLink();
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    Widget imageWidget(double scale) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(
            top: isHover ? height * 0.005 : height * 0.01,
            bottom: !isHover ? height * 0.005 : height * 0.01),
        child: InkWell(
          onTap: () {},
          onHover: (bool value) {
            setState(() {
              isHover = value;
            });
          },
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: ClipOval(
              child: data[2] != ''
                  ? Image.asset('assets/contact_me/${data[2]}', scale: scale)
                  : Image.asset('assets/contact_me/constant/picture.png',
                      scale: scale)),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 1000) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  CustomText(
                      text: 'Reach Out to me!',
                      fontSize: 28,
                      color: Theme.of(context).primaryColorLight),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 7,
                              color: CustomTheme.darkTheme.cardColor,
                            )),
                        child: imageWidget(2.7)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: CustomText(
                        text:
                            'DISCUSS A PROJECT OR JUST WANT TO SAY HI? MY INBOX IS OPEN FOR ALL.',
                        fontSize: 18,
                        color: Theme.of(context)
                            .primaryColorLight
                            .withOpacity(0.7)),
                  ),
                  MyBio(fontSize: 15),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5.0,
                      top: 3.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (data[0] != '')
                          Image.asset(
                              currentTheme.currentTheme == ThemeMode.dark
                                  ? 'assets/contact_me/constant/location-dark.png'
                                  : 'assets/contact_me/constant/location.png',
                              scale: 4)
                        else
                          const Center(),
                        CustomText(
                            text: ' ${data[0]}',
                            fontSize: 18,
                            color: Theme.of(context).primaryColorLight),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                      top: 5.0,
                    ),
                    child: data[1] != ''
                        ? CustomText(
                            text: 'Open for opportunities: ${data[1]}',
                            fontSize: 18,
                            color: Theme.of(context).primaryColorLight)
                        : const Center(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SocialMediaBar(
                      height: height,
                    ),
                  ),
                ],
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
                    SizedBox(
                      width: width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: 'Reach Out to me!',
                              fontSize: 35,
                              color: Theme.of(context).primaryColorLight),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomText(
                                text:
                                    'DISCUSS A PROJECT OR JUST WANT TO SAY HI? MY INBOX IS OPEN FOR ALL.',
                                fontSize: 18,
                                color: Theme.of(context)
                                    .primaryColorLight
                                    .withOpacity(0.7)),
                          ),
                          MyBio(fontSize: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [
                                if (data[0] != '')
                                  Image.asset(
                                      currentTheme.currentTheme ==
                                              ThemeMode.dark
                                          ? 'assets/contact_me/constant/location-dark.png'
                                          : 'assets/contact_me/constant/location.png',
                                      scale: 4)
                                else
                                  const Center(),
                                CustomText(
                                    text: ' ${data[0]}',
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColorLight),
                              ],
                            ),
                          ),
                          if (data[1] != '')
                            CustomText(
                                text: 'Open for opportunities: ${data[1]}',
                                fontSize: 18,
                                color: Theme.of(context).primaryColorLight)
                          else
                            const Center(),
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
                                  color: CustomTheme.darkTheme.cardColor,
                                )),
                            child: imageWidget(2.5)),
                        SocialMediaBar(
                          height: height,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }
        }),
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0),
          child: Column(
            children: [
              TextButton(
                onPressed: () => htmlOpenLink(getNameAndLink[1]),
                child: CustomText(
                    text: 'Made with ❤️ by ${getNameAndLink[0]}',
                    fontSize: 10,
                    color: Theme.of(context).primaryColorLight),
              ),
              TextButton(
                onPressed: () => htmlOpenLink(
                    'https://github.com/danger-ahead/flutter_dev_folio'),
                child: CustomText(
                    text: 'Theme by flutter_dev_folio',
                    fontSize: 10,
                    color: Theme.of(context).primaryColorLight),
              )
            ],
          ),
        ),
      ],
    );
  }
}
