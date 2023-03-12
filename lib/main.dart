import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice_one/db/local_db.dart';
import 'package:widget_practice_one/db/screen.dart';
import 'package:widget_practice_one/iu/provider/ebook_provider.dart';
import 'iu/show_widgets/provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await DbHelper.createTable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<EbookProvider>(create: (context) {
        return EbookProvider();
      },),
      ChangeNotifierProvider<WidgetsProvider>(create: (context) {
        return WidgetsProvider();
      },),
    ],
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          //brightness: Brightness.dark,
          primaryTextTheme: GoogleFonts.kalamTextTheme(),
          textTheme: GoogleFonts.senTextTheme(
          )
        ),
        home:  LocalDataBase(),
      );

    },);
  }
}


