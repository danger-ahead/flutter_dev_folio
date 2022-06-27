import 'package:flutter/material.dart';
import '../../tabs/contact_me.dart';
import '../custom/custom_text.dart';
import '../education/data.dart';

class ContactMeButton extends StatelessWidget {
  ContactMeButton({Key? key}) : super(key: key);

  final List<List<String>> data = education();
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: data.isNotEmpty,
      child: TextButton(
        child: CustomText(
            text: 'CONTACT ME',
            fontSize: 20,
            color: Theme.of(context).primaryColor),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactMe()),
        ),
      ),
    );
  }
}
