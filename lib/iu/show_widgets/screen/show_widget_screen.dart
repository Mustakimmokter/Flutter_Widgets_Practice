import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice_one/iu/show_widgets/provider/provider.dart';
import 'package:widget_practice_one/widgets/index.dart';

class ShowWidgetScreen extends StatelessWidget {
   ShowWidgetScreen({Key? key}) : super(key: key);

  List<Widget> widgetList = [
    CustomContainer(color: Colors.red.shade50,),
    CustomContainer(color: Colors.indigo.shade50,),
  ];


  @override
  Widget build(BuildContext context) {
    final widgetsProvider = Provider.of<WidgetsProvider>(context);
    return WillPopScope(
      onWillPop: (){
        widgetsProvider.getExitDialog(context);
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          excludeHeaderSemantics: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: ToggleButtons(
              onPressed: (value){
                widgetsProvider.getToggle(value);
              },
              selectedColor: Colors.white,
              isSelected: widgetsProvider.isCheck,
              borderColor: Colors.grey,
              selectedBorderColor: Colors.white,
              color: Colors.grey,
              children: const [
                Icon(Icons.bluetooth),
                Icon(Icons.bolt_outlined),
                Icon(Icons.wifi),
                Icon(Icons.add_circle)
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: ()async{
            
          },

          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(15, (index){
                return CustomContainer(
                  margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: 60,
                  width: double.maxFinite,
                  borderRound: 05,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    ),
                  ],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: 'This is refresh indicator',
                        alignment: TextAlign.left,
                      ),
                      Radio(
                        value: index,
                        groupValue: widgetsProvider.selectedIndex,
                        onChanged: (value){
                          widgetsProvider.getSelect(value!);
                        },
                      ),
                    ],
                  ),
                );
              }) ,
            ),
          ),
        ),
        drawer: CustomContainer(
          padding: const EdgeInsets.all(0),
          width: 260,
          child: Column(
            children: const [
              CustomContainer(
                height: 200,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
