import 'package:flutter/material.dart';
import 'package:widget_practice_one/utils/utils.dart';
import 'package:widget_practice_one/widgets/index.dart';

class KRoundedButton extends StatelessWidget {
  const KRoundedButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.color = primaryBrandColor,
    this.iconColor = Colors.white
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final Color? color,iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        borderRound: 100,
        height: 40,
        width: 40,
        color: color,
        child: Icon(
          icon,
          color: iconColor,
          size: 22,
        ),
      ),
    );
  }
}
