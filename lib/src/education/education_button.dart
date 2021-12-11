import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/routes/education.dart';
import 'package:flutter_dev_folio/src/custom/text_style.dart';
import 'package:flutter_dev_folio/src/education/data.dart';

class EducationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: education(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Visibility(
            visible: (snapshot.data as List<List<String>>).length != 0,
            child: TextButton(
              child: text('EDUCATION', 20, Theme.of(context).primaryColor),
              onPressed: () => Navigator.pushNamed(context, Education.route),
            ),
          );
        }
        return Center();
      },
    );
  }
}
