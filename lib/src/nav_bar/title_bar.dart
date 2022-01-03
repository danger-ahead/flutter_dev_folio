import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar(
      {Key? key,
      required this.height,
      required this.width,
      required this.title})
      : super(key: key);

  final double height, width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: height * 0.04),
      color: Theme.of(context).scaffoldBackgroundColor,
      width: width * 0.9,
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: TextStyle(
            fontFamily: 'SourceCodePro',
            letterSpacing: 10.5,
            color: Theme.of(context).primaryColorLight,
            fontSize: 20),
      ),
    );
  }
}
