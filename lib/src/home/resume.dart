import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import '../html_open_link.dart';
import 'data.dart';

class Resume extends StatelessWidget {
  Resume({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  final String data = resume();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: data == ''
            ? EdgeInsets.zero
            : EdgeInsets.only(right: width * 0.019),
        child: Visibility(
          visible: data != '',
          child: TextButton(
              onPressed: () => htmlOpenLink(data),
              child: CustomText(
                  text: 'MY RESUME',
                  fontSize: 20,
                  color: Theme.of(context).primaryColor)),
        ));
  }
}
