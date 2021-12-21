import 'package:flutter/material.dart';
import 'data.dart';

class MyBio extends StatelessWidget {
  MyBio({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  final double fontSize;
  final String getBio = bio();

  @override
  Widget build(BuildContext context) {
    return (getBio == '')
        ? const Center()
        : Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    '"$getBio"',
                    style: TextStyle(
                        fontFamily: 'SourceCodePro',
                        letterSpacing: 2,
                        color: Theme.of(context).primaryColorLight,
                        fontSize: fontSize),
                  ),
                ),
              ],
            ),
          );
  }
}
