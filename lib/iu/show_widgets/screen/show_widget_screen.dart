import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice_one/iu/show_widgets/provider/provider.dart';
import 'package:widget_practice_one/widgets/index.dart';

class ShowWidgetScreen extends StatelessWidget {
  const ShowWidgetScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final widgetsProvider = Provider.of<WidgetsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: (){
                  widgetsProvider.getTime(context);
                },
                child: CustomText(
                  text: widgetsProvider.time != null? "${widgetsProvider.time!.hour}:${widgetsProvider.time!.minute}" : 'PickTime',
                  color: Colors.black54,
                ),),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: (){
                  widgetsProvider.getDate(context);
                },
                child: CustomText(
                    text: widgetsProvider.date != null ? "${widgetsProvider.date!.day}-${widgetsProvider.date!.month}-${widgetsProvider.date!.year}" : 'Pick Date',
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              TabBar(
                tabs: List.generate(3, (index) {
                  return Tab(text: 'Tan');
                }),
                onTap: (index){

                },
                controller: widgetsProvider.tabController,
                padding: EdgeInsets.all(0),
                labelColor: Colors.indigo,
              ),
              Expanded(
                child: TabBarView(
                    children: List.generate(3, (index) {
                      return CustomContainer(
                      color: index.isEven? Colors.indigo : Colors.cyan,
                      );
                    }),
                  controller: widgetsProvider.tabController,
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
