import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice_one/admob/admob.dart';
import 'package:widget_practice_one/alarm_button/screen.dart';
import 'package:widget_practice_one/animations/screen.dart';
import 'package:widget_practice_one/db/local_db.dart';
import 'package:widget_practice_one/db/provider_data_listen.dart';
import 'package:widget_practice_one/iu/provider/ebook_provider.dart';
import 'package:widget_practice_one/map/google_maps.dart';
import 'package:widget_practice_one/widgets/drag_and_drop.dart';
import 'http_services/screen.dart';
import 'iu/show_widgets/provider/provider.dart';
import 'iu/show_widgets/screen/show_widget_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Hive.initFlutter();
  await DbHelper.createTable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<EbookProvider>(create: (_) {
        return EbookProvider();
      },),
      ChangeNotifierProvider<WidgetsProvider>(create: (_) {
        return WidgetsProvider();
      },),
      ChangeNotifierProvider<DataListener>(create: (_) {
        return DataListener();
      },)
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
        home:  const AnimationScreen(),
      );

    },);
  }
}



