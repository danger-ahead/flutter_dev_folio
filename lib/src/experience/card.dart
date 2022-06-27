import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import '../theme/config.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.desc,
      required this.period,
      required this.role,
      required this.isMobile})
      : super(key: key);

  final String image, title, desc, period, role;
  final bool isMobile;

  @override
  _ExperienceCardState createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isHover ? Colors.black12 : Colors.black45,
            blurRadius: 10.0,
            offset: const Offset(8, 12),
          )
        ],
      ),
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
          top: isHover ? height * 0.005 : height * 0.01,
          bottom: !isHover ? height * 0.005 : height * 0.01),
      child: InkWell(
        onHover: (bool value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: () {},
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(
            top: 5.0,
          ),
          width: !widget.isMobile ? width * 0.28 : width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isHover ? Colors.black12 : Colors.black45,
                blurRadius: 10.0,
                offset: const Offset(8, 12),
              )
            ],
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(
              5.0,
            ),
            border: Border.all(
              width: 3,
              color: currentTheme.currentTheme == ThemeMode.dark
                  ? Theme.of(context).cardColor
                  : Theme.of(context).primaryColor,
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/experience/${widget.image}',
                scale: 1.1,
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                    top: height * 0.02,
                    left: width * 0.015,
                    right: width * 0.01,
                    bottom: height * 0.02),
                width: !widget.isMobile ? width * 0.28 : width,
                decoration: BoxDecoration(
                  color: currentTheme.currentTheme == ThemeMode.dark
                      ? Theme.of(context).cardColor
                      : Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      FittedBox(
                          fit: BoxFit.cover,
                          child: CustomText(
                              text: widget.title,
                              fontSize: 25,
                              color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 16.0),
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: CustomText(
                                text: widget.role,
                                fontSize: 14,
                                color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: CustomText(
                                text: widget.period,
                                fontSize: 15,
                                color: Colors.white)),
                      ),
                      CustomText(
                          text: widget.desc, fontSize: 15, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
