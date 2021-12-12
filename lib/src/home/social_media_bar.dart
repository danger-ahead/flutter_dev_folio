import 'package:flutter_dev_folio/src/home/data.dart';
import 'package:flutter_dev_folio/src/htmlOpenLink.dart';
import 'package:flutter/material.dart';

class SocialMediaBar extends StatelessWidget {
  final data = socialMedia();

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
        padding: const EdgeInsets.only(top: 30.0),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Row(
            children: List.generate(data.length, (i) {
              return IconButton(
                  iconSize: 50.0,
                  hoverColor: Theme.of(context).hoverColor,
                  icon: (data[i][1] != '' &&
                          currentSupportedSocialMedia.indexOf(data[i][1]) != -1)
                      ? Image.asset(
                          'assets/home/constant/' + data[i][1] + '.png',
                        )
                      : Image.asset(
                          'assets/home/constant/link.png',
                        ),
                  onPressed: () {
                    htmlOpenLink(data[i][0]);
                  });
            }),
          ),
        ));
  }
}
