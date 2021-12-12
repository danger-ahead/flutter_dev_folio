import 'package:flutter_dev_folio/src/home/data.dart';
import 'package:flutter_dev_folio/src/htmlOpenLink.dart';
import 'package:flutter/material.dart';

class SocialMediaBar extends StatelessWidget {
  SocialMediaBar({Key? key, required this.height}) : super(key: key);
  final data = socialMedia();
  final double height;

  @override
  Widget build(BuildContext context) {
    List<String> currentSupportedSocialMedia = [
      'email',
      'facebook',
      'github',
      'instagram',
      'linkedin',
      'medium',
      'stackoverflow',
      'twitter'
    ];
    return Padding(
        padding: EdgeInsets.only(top: height * 0.03),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Row(
            children: List.generate(data.length, (i) {
              return IconButton(
                  iconSize: 50.0,
                  hoverColor: Colors.transparent,
                  icon: (data[i][1] != '' &&
                          currentSupportedSocialMedia.indexOf(data[i][1]) != -1)
                      ? SocialMediaButton(
                          image: 'assets/home/constant/' + data[i][1] + '.png',
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
  SocialMediaButton(
      {Key? key, required this.image, required this.height, required this.link})
      : super(key: key);
  _SocialMediaButton createState() => _SocialMediaButton();

  final String image, link;
  final double height;
}

class _SocialMediaButton extends State<SocialMediaButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.only(
          top: (isHover) ? widget.height * 0.005 : widget.height * 0.01,
          bottom: !(isHover) ? widget.height * 0.005 : widget.height * 0.01),
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          htmlOpenLink(widget.link);
        },
        onHover: (val) {
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
