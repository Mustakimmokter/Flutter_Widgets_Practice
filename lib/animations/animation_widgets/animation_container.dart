import 'package:flutter/material.dart';

class CustomAnimationContainer extends StatelessWidget {
  const CustomAnimationContainer({super.key, required this.isAnimate, required this.child}) ;

  final bool isAnimate;
  final Widget child;


  Widget _data(){
     return Column(
       children: [
         Text('Mustakim'),
         Text('01779-504864'),
       ],
     );

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 10,left: 20,right: 20),
          duration: const Duration(milliseconds: 300),
          decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          height: isAnimate ? 60 : 0,
          width: double.maxFinite,
          child: child,
        ),
      ],
    );
  }
}



class ListModel {
  ListModel({this.isCollapse,this.address,this.name});

  late bool? isCollapse;
  late String? name,address;

  static List<ListModel> listData (){
    return [
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
      ListModel(),
    ];
  }

}