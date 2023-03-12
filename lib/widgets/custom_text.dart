import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.size = 20,
    this.color,
    this.fontWeight,
    this.alignment = TextAlign.center,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? alignment;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
        //fontFamily: 'Poppins',
        overflow: textOverflow,
      ),
    );
  }
}
