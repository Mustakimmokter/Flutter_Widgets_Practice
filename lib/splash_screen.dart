import 'package:flutter/material.dart';
import 'package:widget_practice_one/widgets/shimmer_effects.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
        (){
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return ShimmerEffectState();
          }));
        });
        }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset('images/playstore.png',scale: 4,),
    );
  }
}
