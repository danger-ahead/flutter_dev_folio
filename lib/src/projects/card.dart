import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import '../html_open_link.dart';
import '../theme/config.dart';
import 'data.dart';

class ProjectsCard extends StatefulWidget {
  const ProjectsCard(
      {Key? key,
      required this.title,
      required this.techStack,
      required this.desc,
      required this.link,
      required this.isMobile})
      : super(key: key);

  final String title, techStack, desc, link;
  final bool isMobile;
  @override
  _ProjectsCardState createState() => _ProjectsCardState();
}

class _ProjectsCardState extends State<ProjectsCard> {
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
        onTap: () => htmlOpenLink(widget.link),
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
              top: height * 0.02,
              left: width * 0.015,
              right: width * 0.015,
              bottom: height * 0.02),
          width: !widget.isMobile ? width * 0.28 : width,
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
          child: (widget.title == '' && widget.link != '')
              ? FutureBuilder(
                  future: github(widget.link),
                  builder:
                      (BuildContext context, AsyncSnapshot<Object?> snapshot) {
                    if (snapshot.hasData) {
                      final List<String> data = snapshot.data as List<String>;
                      return Column(
                        children: [
                          Center(
                            child: Column(
                              children: <Widget>[
                                FittedBox(
                                    fit: BoxFit.cover,
                                    child: CustomText(
                                        text: data[0],
                                        fontSize: 25,
                                        color: Colors.white)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 16.0),
                                  child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: CustomText(
                                          text: data[1],
                                          fontSize: 14,
                                          color: Colors.white)),
                                ),
                                CustomText(
                                    text: data[2],
                                    fontSize: 15,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/projects/constant/stars.png',
                                  scale: 2),
                              Padding(
                                padding: const EdgeInsets.only(right: 24.0),
                                child: CustomText(
                                    text: ' ${data[3]}',
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                              Image.asset('assets/projects/constant/forks.png',
                                  scale: 2),
                              CustomText(
                                  text: ' ${data[4]}',
                                  fontSize: 12,
                                  color: Colors.white),
                            ],
                          ),
                        ],
                      );
                    }
                    return const Center();
                  })
              : Column(
                  children: [
                    Center(
                      child: Column(
                        children: <Widget>[
                          FittedBox(
                              fit: BoxFit.cover,
                              child: CustomText(
                                  text: widget.title,
                                  fontSize: 25,
                                  color: Colors.white)),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 16.0),
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: CustomText(
                                    text: widget.techStack,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ),
                          CustomText(
                              text: widget.desc,
                              fontSize: 15,
                              color: Colors.white),
                        ],
                      ),
                    ),
                    FutureBuilder(
                        future: starsAndForks(widget.link),
                        builder: (BuildContext context,
                            AsyncSnapshot<Object?> snapshot) {
                          if (snapshot.hasData) {
                            final List<String> data =
                                snapshot.data as List<String>;
                            if (data[1] == 'null' && data[0] == 'null')
                              return const Center();
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 5.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                      'assets/projects/constant/stars.png',
                                      scale: 2),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24.0),
                                    child: CustomText(
                                        text: ' ${data[0]}',
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                  Image.asset(
                                      'assets/projects/constant/forks.png',
                                      scale: 2),
                                  CustomText(
                                      text: ' ${data[1]}',
                                      fontSize: 12,
                                      color: Colors.white),
                                ],
                              ),
                            );
                          }
                          return const Center();
                        }),
                  ],
                ),
        ),
      ),
    );
  }
}
