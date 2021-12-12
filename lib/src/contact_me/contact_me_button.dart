import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/routes/contact_me.dart';
import 'package:flutter_dev_folio/src/custom/text_style.dart';
import 'package:flutter_dev_folio/src/education/data.dart';

class ContactMeButton extends StatelessWidget {
  final data = education();
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: data.length != 0,
      child: TextButton(
        child: text('CONTACT ME', 20, Theme.of(context).primaryColor),
        onPressed: () => Navigator.pushNamed(context, ContactMe.route),
      ),
    );
  }
}
