import 'package:flutter/material.dart';

TextStyle textStyle(double fontSize, Color color) => TextStyle(
      fontFamily: 'Montserrat',
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
    );

class UnderlinedButton extends StatefulWidget {
  const UnderlinedButton(
      {Key? key,
      required this.context,
      required this.btnName,
      required this.btnNumber,
      required this.routeName})
      : super(key: key);

  @override
  _UnderlinedButtonState createState() => _UnderlinedButtonState();

  final BuildContext context;
  final String btnName, btnNumber, routeName;
}

class _UnderlinedButtonState extends State<UnderlinedButton> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(5.0),
        hoverColor: Colors.transparent,
        onTap: (() => Navigator.pushNamed(context, widget.routeName)),
        onHover: (value) => setState(() => _isHover = value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.btnNumber,
                    style: textStyle(13, Theme.of(context).primaryColorLight)),
                Text(widget.btnName,
                    style: textStyle(21, Theme.of(context).primaryColor)),
              ],
            ),
            Visibility(
              visible: _isHover,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.005,
                width: MediaQuery.of(context).size.width * 0.045,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
