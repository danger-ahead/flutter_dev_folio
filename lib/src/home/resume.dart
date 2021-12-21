import 'package:flutter/material.dart';

import '../custom/text_style.dart';
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
              child: text('MY RESUME', 20, Theme.of(context).primaryColor)),
        ));
  }
}
