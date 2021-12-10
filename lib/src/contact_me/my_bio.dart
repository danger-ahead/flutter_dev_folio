import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/src/contact_me/data.dart';

class MyBio extends StatelessWidget {
  const MyBio({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: bio(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            final String? bio = snapshot.data;
            if (bio == '') return Center();
            return Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 30.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      '"' + bio! + '"',
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
          } else
            return Center();
        });
  }
}
