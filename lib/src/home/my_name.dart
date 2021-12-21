import 'package:flutter/material.dart';
import 'data.dart';

class MyName extends StatelessWidget {
  MyName({
    Key? key,
    required this.isMobile,
    required this.context,
  }) : super(key: key);

  final bool isMobile;
  final BuildContext context;
  final String data = name();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(data.split(' ').length, (int i) {
                  return SizedBox(
                    width: width - width * 0.4,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        data.split(' ')[i],
                        textScaleFactor: 4.5,
                        style: TextStyle(
                          fontFamily: 'FjallaOne',
                          // letterSpacing: 10.5,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  );
                }))
            : Text(data,
                textScaleFactor: 7,
                style: TextStyle(
                  fontFamily: 'FjallaOne',
                  letterSpacing: 20.5,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                )));
  }
}
