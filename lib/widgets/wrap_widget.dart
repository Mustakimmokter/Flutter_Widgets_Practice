
import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(5, (index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10,),
          height: 200,
          color: index.isEven? Colors.red: Colors.blue,
          width: MediaQuery.of(context).size.width / 2,
        );
      }),
    );
  }
}
