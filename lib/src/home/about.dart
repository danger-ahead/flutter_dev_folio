import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/src/home/data.dart';

class About extends StatelessWidget {
  const About({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: about(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            final String? about = snapshot.data;
            if (about == "") return Center();
            return Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 30.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      about!,
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
          } else
            return Center();
        });
  }
}
