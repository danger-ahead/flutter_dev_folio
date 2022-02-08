import 'package:flutter/material.dart';

import '../html_open_link.dart';
import 'data.dart';

class SocialMediaBar extends StatelessWidget {
  SocialMediaBar({Key? key, required this.height}) : super(key: key);
  final List<List<String>> data = socialMedia();
  final double height;

  @override
  Widget build(BuildContext context) {
    final List<String> currentSupportedSocialMedia = [
      'email',
      'facebook',
      'github',
      'instagram',
      'linkedin',
      'medium',
      'stackoverflow',
      'twitter',
      'leetcode'
    ];
    return Padding(
        padding: EdgeInsets.only(top: height * 0.03),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Row(
            children: List.generate(data.length, (int i) {
              return IconButton(
                  iconSize: 50.0,
                  hoverColor: Colors.transparent,
                  icon: (data[i][1] != '' &&
                          currentSupportedSocialMedia.contains(data[i][1]))
                      ? SocialMediaButton(
                          image: 'assets/home/constant/${data[i][1]}.png',
                          link: data[i][0],
                          height: height)
                      : SocialMediaButton(
                          image: 'assets/home/constant/link.png',
                          link: data[i][0],
                          height: height,
                        ),
                  onPressed: () {
                    htmlOpenLink(data[i][0]);
                  });
            }),
          ),
        ));
  }
}

class SocialMediaButton extends StatefulWidget {
  const SocialMediaButton(
      {Key? key, required this.image, required this.height, required this.link})
      : super(key: key);
  @override
  _SocialMediaButton createState() => _SocialMediaButton();

  final String image, link;
  final double height;
}

class _SocialMediaButton extends State<SocialMediaButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
          top: isHover ? widget.height * 0.005 : widget.height * 0.01,
          bottom: !isHover ? widget.height * 0.005 : widget.height * 0.01),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          htmlOpenLink(widget.link);
        },
        onHover: (bool val) {
          setState(() {
            isHover = val;
          });
        },
        child: Image.asset(
          widget.image,
        ),
      ),
    );
  }
}
