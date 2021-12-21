import 'package:flutter/material.dart';
import 'data.dart';

class About extends StatelessWidget {
  About({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  final double fontSize;
  final String gotAbout = about();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 30.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              gotAbout,
              style: TextStyle(
                  fontFamily: 'SourceCodePro',
                  letterSpacing: 2.5,
                  color: Theme.of(context).primaryColorLight,
                  fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
