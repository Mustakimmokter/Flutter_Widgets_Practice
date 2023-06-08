import 'package:flutter/material.dart';
import 'package:widget_practice_one/alarm_button/alarm_button.dart';

class AlarmButtonScreen extends StatelessWidget {
  const AlarmButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Alarm Button Here'),
            SizedBox(height: 20),
            AlarmButton(
              onTap: (){},
            ),
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
