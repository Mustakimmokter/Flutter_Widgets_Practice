import 'package:flutter/material.dart';
import 'package:widget_practice_one/widgets/index.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.title,
    this.height = 100,
    this.topPadding = 30,
    this.backgroundColor = Colors.red,
  }) : super(key: key);

  final String title;
  final double? height, topPadding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.only(top: topPadding!),
      height: height,
      color: backgroundColor,
      child: CustomText(text: title, color: Colors.white),
    );
  }
}
