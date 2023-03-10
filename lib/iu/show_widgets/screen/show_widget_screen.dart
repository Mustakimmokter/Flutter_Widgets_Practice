
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:widget_practice_one/iu/show_widgets/provider/provider.dart';

class ShowWidgetScreen extends StatefulWidget {
   const ShowWidgetScreen({Key? key}) : super(key: key);

  @override
  State<ShowWidgetScreen> createState() => _ShowWidgetScreenState();
}

class _ShowWidgetScreenState extends State<ShowWidgetScreen> {



  @override
  Widget build(BuildContext context) {
    final widgetsProvider = Provider.of<WidgetsProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
      ),
    );
  }
}
