
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:widget_practice_one/http_services/http.dart';
import 'package:widget_practice_one/http_services/models/user_data.dart';
import 'package:widget_practice_one/http_services/models/users.dart';
import 'package:widget_practice_one/iu/show_widgets/provider/provider.dart';

class ShowWidgetScreen extends StatelessWidget {
   const ShowWidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetsProvider = Provider.of<WidgetsProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: const [
            SizedBox(

            )
          ],
        ),
      ),
    );
  }
}
