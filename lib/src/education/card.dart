import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import '../theme/config.dart';

class EducationDesktop extends StatefulWidget {
  const EducationDesktop(
      {Key? key,
      required this.instiution,
      required this.location,
      required this.desc,
      required this.grades,
      required this.years,
      required this.image})
      : super(key: key);

  final String instiution, location, years, grades, desc, image;
  @override
  _EducationDesktopState createState() => _EducationDesktopState();
}

class _EducationDesktopState extends State<EducationDesktop> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
          padding: EdgeInsets.only(
              top: height * 0.04,
              left: width * 0.015,
              right: width * 0.015,
              bottom: height * 0.04),
          width: width / 1.15,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isHover ? Colors.black12 : Colors.black45,
                blurRadius: 10.0,
                offset: const Offset(8, 12),
              )
            ],
            color: currentTheme.currentTheme == ThemeMode.dark
                ? Theme.of(context).cardColor
                : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          child: Column(
            children: [
              Visibility(
                visible: width < 1000,
                child: Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: AssetImage('assets/education/${widget.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Visibility(
                    visible: width >= 1000,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage('assets/education/${widget.image}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        FittedBox(
                            fit: BoxFit.cover,
                            child: CustomText(
                                text: widget.instiution,
                                fontSize: 20,
                                color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: FittedBox(
                              fit: BoxFit.cover,
                              child: CustomText(
                                  text: widget.location,
                                  fontSize: 10,
                                  color: Colors.white)),
                        ),
                        FittedBox(
                            fit: BoxFit.cover,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 11.0),
                              child: CustomText(
                                  text: widget.years != ''
                                      ? 'Years of study: ${widget.years}'
                                      : '',
                                  fontSize: 12,
                                  color: Colors.white),
                            )),
                        FittedBox(
                            fit: BoxFit.cover,
                            child: CustomText(
                                text: widget.desc,
                                fontSize: 13,
                                color: Colors.white)),
                        FittedBox(
                            fit: BoxFit.cover,
                            child: CustomText(
                                text: widget.grades != ''
                                    ? 'Grades Achieved: ${widget.grades}'
                                    : '',
                                fontSize: 12,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
