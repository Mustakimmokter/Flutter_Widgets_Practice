
import 'package:flutter/material.dart';
import 'package:widget_practice_one/widgets/icon_button.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          onPressed: (){},
          icon: Icons.arrow_back_ios,
        ),
        const FlutterLogo(),
        CustomIconButton(
          icon: Icons.menu,
          onPressed: (){},
        ),

      ],
    );
  }
}
