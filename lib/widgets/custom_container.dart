import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.child,
    this.boxShadow,
    this.borderRadius,
    this.borderRound = 0,
    this.width,
    this.height,
    this.color = Colors.white,
    this.margin,
    this.padding,
    this.decorationImage,
    this.boxBorder,
  }) : super(key: key);

  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final BorderRadius? borderRadius;
  final double? borderRound,width,height;
  final Color? color;
  final EdgeInsets? padding,margin;
  final DecorationImage? decorationImage;
  final Border? boxBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      padding: padding ??  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(borderRound!),
        border: boxBorder,
        boxShadow: boxShadow,
        image: decorationImage,
      ),
      child: child,
    );
  }
}
