import 'package:flutter_dev_folio/src/home/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_folio/src/custom/text_style.dart';

class Designation extends StatelessWidget {
  const Designation({
    Key? key,
    required this.isMobile,
    required this.context,
  }) : super(key: key);

  final bool isMobile;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: designation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data as List<String>;
          if (data.length == 0 && data[0] == '') return Center();
          return Row(
            children: [
              Icon(
                Icons.play_arrow_rounded,
                color: Theme.of(context).primaryColorLight,
                size: isMobile ? 50 : 60,
              ),
              TextSwapController(
                data: data,
                isMobile: isMobile,
              ),
            ],
          );
        }
        return Center();
      },
    );
  }
}

class TextSwapController extends StatefulWidget {
  const TextSwapController({
    Key? key,
    required this.data,
    required this.isMobile,
  }) : super(key: key);

  final List<String> data;
  final bool isMobile;

  @override
  _TextSwapControllerState createState() => _TextSwapControllerState();
}

class _TextSwapControllerState extends State<TextSwapController> {
  @override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer();
  }

  void _timer() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      if (mounted) setState(() {});
      _timer();
    });
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.data.length == i) i = 0;
    return text(
        widget.isMobile
            ? widget.data[i++].replaceAll(" ", "\n")
            : widget.data[i++],
        widget.isMobile ? 40 : 60,
        Theme.of(context).primaryColorLight);
  }
}
