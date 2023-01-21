import 'package:flutter/material.dart';
import 'package:widget_practice_one/iu/component/app_header.dart';
import 'package:widget_practice_one/utils/utils.dart';
import 'package:widget_practice_one/widgets/index.dart';


class TalentHireScreen extends StatelessWidget {
  const TalentHireScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: RefreshIndicator(
        color: primaryBrandColor,
        strokeWidth: 3,
        //displacement: 100,
        edgeOffset: 100,
        onRefresh: ()async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  CustomContainer(
                    height: 160,
                    child: Column(
                      children: const [
                       AppHeader(),
                        SizedBox(height: 20),
                        CustomText(
                          text: 'Get Coaching',
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  CustomContainer(
                    margin: const EdgeInsets.only(top: 130,left: 25,right: 25),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    borderRound: 14,
                    height: 100,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        offset: Offset(2, 2),
                      )
                    ],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CustomText(
                              text: 'YOU HAVE',
                              size: 14,
                              color: Colors.grey,
                            ),
                            CustomText(
                              size: 25,
                              text: '206',
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: CustomContainer(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 14),
                            color: Colors.green.withOpacity(0.1),
                            borderRound: 05,
                            child: const CustomText(
                              size: 18,
                              color: primaryBrandColor,
                              fontWeight: FontWeight.bold,
                              text: 'Buy More',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(
                      size: 14, fontWeight: FontWeight.w600,

                      color: Colors.grey,
                      text: 'MY COACHES',
                    ),
                    CustomText(
                      size: 14,
                      fontWeight: FontWeight.w600,
                      color: primaryBrandColor,
                      text: 'VIEW PAST COACHES',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    itemCount: 8,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 210,
                      ),
                      itemBuilder: (context, index) {
                        return CustomContainer(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(top: 12),
                          borderRound: 10,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  const CustomContainer(
                                    borderRound: 100,
                                    height: 50,
                                    width: 50,
                                    decorationImage: DecorationImage(image: AssetImage('images/image-1.jpg')),
                                  ),
                                  CustomContainer(
                                    margin: const EdgeInsets.only(left: 42,top: 05),
                                    height: 12,
                                    width: 12,
                                    color: index == 0 || index == 3 || index == 4 || index == 7?
                                    primaryBrandColor : Colors.amber,
                                    borderRound: 100,
                                    boxBorder: Border.all(color: Colors.white,width: 2,strokeAlign: StrokeAlign.outside),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const CustomText(text: 'Alex',fontWeight: FontWeight.bold,size: 18,),
                              const SizedBox(height: 10),
                              const CustomText(text: 'Available for\n the next 5 hours',size: 14,color: Colors.grey,),
                              const SizedBox(height: 10),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){},
                                  child: CustomContainer(
                                    padding: EdgeInsets.only(top: 17),
                                    width: double.maxFinite,
                                    color: index == 0 || index == 3 || index == 4 || index == 7?
                                    primaryBrandColor:Colors.grey.shade400,
                                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                                    child: const CustomText(
                                      size: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      text: 'Request',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
