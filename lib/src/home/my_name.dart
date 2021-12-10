import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/src/home/data.dart';

class MyName extends StatelessWidget {
  const MyName({
    Key? key,
    required this.isMobile,
    required this.context,
  }) : super(key: key);

  final bool isMobile;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: FutureBuilder(
          future: name(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (isMobile) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        snapshot.data.toString().split(" ").length, (i) {
                      return SizedBox(
                        width: width - width * 0.4,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            snapshot.data.toString().split(" ")[i],
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
                    }));
              }

              return Text(snapshot.data.toString(),
                  textScaleFactor: 7,
                  style: TextStyle(
                    fontFamily: 'FjallaOne',
                    letterSpacing: 20.5,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ));
            } else {
              return Text('Loading...',
                  textScaleFactor: 4.5,
                  style: TextStyle(
                    fontFamily: 'FjallaOne',
                    letterSpacing: 4.5,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ));
            }
          }),
    );
  }
}
