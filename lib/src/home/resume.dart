import 'package:flutter_dev_folio/src/custom/text_style.dart';
import 'package:flutter_dev_folio/src/htmlOpenLink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/src/home/data.dart';

class Resume extends StatelessWidget {
  const Resume({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: resume(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: snapshot.data.toString() == ''
                    ? EdgeInsets.all(0)
                    : EdgeInsets.only(right: width * 0.019),
                child: Visibility(
                  visible: snapshot.data.toString() != '',
                  child: TextButton(
                      onPressed: () => htmlOpenLink(snapshot.data.toString()),
                      child: text(
                          'MY RESUME', 20, Theme.of(context).primaryColor)),
                ));
          } else {
            return Center();
          }
        });
  }
}
