import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice_one/iu/provider/ebook_provider.dart';
import 'iu/screen/ebook_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<EbookProvider>(create: (context) {
        return EbookProvider();
      },)
    ],
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const EbookApp(),
      );
    },);
  }
}


