import 'package:flutter/material.dart';

TextStyle textStyle(double fontSize, Color color) => TextStyle(
      fontFamily: 'Montserrat',
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
    );

Widget navBarBtn(
    BuildContext context, String routeName, String btnNumber, String btnName) {
  return MaterialButton(
    hoverColor: Theme.of(context).hoverColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    onPressed: () {
      Navigator.pushNamed(context, routeName);
    },
    child: Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        children: [
          Text(btnNumber,
              style: textStyle(13, Theme.of(context).primaryColorLight)),
          Text(btnName, style: textStyle(21, Theme.of(context).primaryColor)),
        ],
      ),
    ),
  );
}
