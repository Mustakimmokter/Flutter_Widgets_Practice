import 'package:flutter/material.dart';
import 'package:widget_practice_one/utils/utils.dart';
import 'package:widget_practice_one/widgets/custom_container.dart';
import 'package:widget_practice_one/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.title = 'Buy More',
      required this.onTap,
      this.backgroundColor = primaryBrandColor,
      this.titleColor = Colors.white,
        this.horizontalPadding = 20,
        this.verticalPadding = 10,
        this.titleSize = 18
      })
      : super(key: key);

  final String? title;
  final VoidCallback onTap;
  final Color? backgroundColor, titleColor;
  final double? horizontalPadding, verticalPadding, titleSize;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 50,
      child: CustomContainer(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding!, vertical: verticalPadding!),
        color: backgroundColor,
        borderRound: 05,
        child: CustomText(
          size: titleSize,
          color: titleColor,
          fontWeight: FontWeight.bold,
          text: title!,
        ),
      ),
    );
  }
}
