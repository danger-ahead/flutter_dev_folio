import 'package:flutter_dev_folio/src/custom/text_style.dart';
import 'package:flutter_dev_folio/src/htmlOpenLink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/src/home/data.dart';

class Resume extends StatelessWidget {
  Resume({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  final data = resume();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: data.toString() == ''
            ? EdgeInsets.all(0)
            : EdgeInsets.only(right: width * 0.019),
        child: Visibility(
          visible: data.toString() != '',
          child: TextButton(
              onPressed: () => htmlOpenLink(data.toString()),
              child: text('MY RESUME', 20, Theme.of(context).primaryColor)),
        ));
  }
}
