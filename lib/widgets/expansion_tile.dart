import 'package:flutter/material.dart';
import 'package:widget_practice_one/widgets/custom_container.dart';
import 'package:widget_practice_one/widgets/custom_text.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: const CustomText(text: 'Mustakim'),
          //subtitle: const CustomText(text: '01779-5049864',size: 14,),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,

          leading: CircleAvatar(
            child: CustomText(text: '${index + 1}'),
          ),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
          collapsedBackgroundColor: Colors.transparent,
          children: [
            SizedBox(
              height: 300,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(alignment: TextAlign.start, text: '${index + 1}. This is test purpose',size: 15,),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
