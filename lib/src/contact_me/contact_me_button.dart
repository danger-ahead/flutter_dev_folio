import 'package:flutter/material.dart';
import '../../tabs/contact_me.dart';
import '../custom/text_style.dart';
import '../education/data.dart';

class ContactMeButton extends StatelessWidget {
  ContactMeButton({Key? key}) : super(key: key);

  final List<List<String>> data = education();
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: data.isNotEmpty,
      child: TextButton(
        child: text('CONTACT ME', 20, Theme.of(context).primaryColor),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactMe()),
        ),
      ),
    );
  }
}
