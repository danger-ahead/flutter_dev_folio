import 'package:flutter/material.dart';

import '../custom/custom_text.dart';

class Progress extends StatefulWidget {
  const Progress(
      {Key? key,
      required this.width,
      required this.widthSecondContainer,
      required this.title,
      required this.sizeProficiencyName,
      required this.sizePercentage})
      : super(key: key);
  @override
  _ProgressState createState() => _ProgressState();

  final double width, widthSecondContainer, sizeProficiencyName, sizePercentage;
  final String title;
}

class _ProgressState extends State<Progress>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      upperBound: widget.widthSecondContainer / 100,
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double percentage = animationController.value * 100;
    return FittedBox(
      fit: BoxFit.cover,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
        ),
        child: Column(
          children: [
            SizedBox(
              width: widget.width / 1.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: widget.title,
                      fontSize: widget.sizeProficiencyName,
                      color: Theme.of(context).primaryColorLight),
                  CustomText(
                      text: '${percentage.toStringAsFixed(0)}%',
                      fontSize: widget.sizePercentage,
                      color: Theme.of(context).primaryColorLight)
                ],
              ),
            ),
            SizedBox(
              width: widget.width / 1.2,
              height: 20,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: LinearProgressIndicator(
                  value: animationController.value,
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).cardColor),
                  backgroundColor: Theme.of(context).cardColor.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
