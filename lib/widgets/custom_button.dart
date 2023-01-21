import 'package:flutter/material.dart';
import 'package:widget_practice_one/utils/utils.dart';
import 'package:widget_practice_one/widgets/custom_container.dart';
import 'package:widget_practice_one/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: CustomContainer(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 14),
        color: Colors.green.withOpacity(0.1),
        borderRound: 05,
        child: const CustomText(
          size: 18,
          color: primaryBrandColor,
          fontWeight: FontWeight.bold,
          text: 'Buy More',
        ),
      ),
    );
  }
}
