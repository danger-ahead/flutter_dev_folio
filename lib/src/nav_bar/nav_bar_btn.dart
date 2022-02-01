import 'package:flutter/material.dart';

import '../../tabs/tabs.dart';

TextStyle textStyle(double fontSize, Color color) => TextStyle(
      fontFamily: 'Montserrat',
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
    );

//The buttons in the top Nav Bar
class UnderlinedButton extends StatefulWidget {
  const UnderlinedButton(
      {Key? key,
      required this.context,
      required this.btnName,
      required this.btnNumber,
      required this.tabNumber})
      : super(key: key);

  @override
  _UnderlinedButtonState createState() => _UnderlinedButtonState();

  final BuildContext context;
  final String btnName, btnNumber;
  final int tabNumber;
}

class _UnderlinedButtonState extends State<UnderlinedButton> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5.0),
      hoverColor: Colors.transparent,
      onTap: () => scroll.scrollTo(
          index: widget.tabNumber,
          duration: const Duration(milliseconds: 2000)),
      onHover: (bool value) => setState(() => _isHover = value),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.13,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Visibility(
                visible: _isHover,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.004,
                  width: MediaQuery.of(context).size.width * 0.045,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.btnNumber,
                    style: textStyle(11, Theme.of(context).primaryColorLight)),
                Text(widget.btnName,
                    style: textStyle(15, Theme.of(context).primaryColor)),
              ],
            ),
            Visibility(
              visible: _isHover,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.004,
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
