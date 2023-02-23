import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
       TextSpan(
         children: [
           TextSpan(text: 'dfsdfsdf'),
           TextSpan(text: 'dfsdfsdf',style: TextStyle(color: Colors.red)),
         ]
       ),
    );
  }
}
