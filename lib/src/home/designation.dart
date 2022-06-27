import 'package:flutter/material.dart';

import '../custom/custom_text.dart';
import 'data.dart';

class Designation extends StatelessWidget {
  Designation({
    Key? key,
    required this.isMobile,
    required this.context,
  }) : super(key: key);

  final bool isMobile;
  final BuildContext context;
  final List<String> data = designation();

  @override
  Widget build(BuildContext context) {
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
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (mounted) setState(() {});
      _timer();
    });
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.data.length == i) i = 0;
    return CustomText(
        text: widget.isMobile
            ? widget.data[i++].replaceAll(' ', '\n')
            : widget.data[i++],
        isTextAlignCenter: false,
        fontSize: widget.isMobile ? 40 : 60,
        color: Theme.of(context).primaryColorLight);
  }
}
