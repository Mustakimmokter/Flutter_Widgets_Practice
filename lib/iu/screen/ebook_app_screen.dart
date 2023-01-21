import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice_one/iu/provider/ebook_provider.dart';
import 'package:widget_practice_one/widgets/icon_button.dart';
import 'package:widget_practice_one/widgets/index.dart';

class EbookApp extends StatelessWidget {
  const EbookApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ebookProvider = Provider.of<EbookProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          // Header
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 08,right: 08,top: 40),
                child: Row(
                  children: [
                    CustomIconButton(
                      icon: Icons.grid_view_sharp,
                      onPressed: (){},
                    ),
                    Spacer(),
                    CustomIconButton(
                      icon: Icons.search,
                      onPressed: (){},
                    ),
                    SizedBox(width: 10),
                    CustomIconButton(
                      icon: Icons.notifications_active,
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: CustomText(text: 'Vcube Team',fontWeight: FontWeight.bold,),
              ),
              SizedBox(
                height: 180,
                child: PageView.builder(
                  onPageChanged: (index){},
                  allowImplicitScrolling: true,
                  itemCount: ebookProvider.teamImage.length,
                  controller: PageController(viewportFraction: .87),
                  //pageSnapping: false,

                  itemBuilder: (context, index) {
                    return CustomContainer(
                      margin: EdgeInsets.only(right: 10),
                      width: double.maxFinite,
                      color: Colors.green,
                      borderRound: 16,
                      decorationImage: DecorationImage(
                        image: AssetImage(ebookProvider.teamImage[index]),
                        fit: BoxFit.cover,
                      ),
                    );
                  },),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        flexibleSpace: const FlexibleSpaceBar(),
                        backgroundColor: Colors.white,
                        pinned: true,
                        elevation: 06,
                        shadowColor: Colors.grey.withOpacity(.2),
                        bottom: PreferredSize(
                            preferredSize: Size.fromHeight(50),
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 0.001,
                              labelPadding: const EdgeInsets.only(left: 06,right: 06),
                              indicatorColor: Colors.white,
                                splashFactory: NoSplash.splashFactory,
                              onTap: (index){},
                              padding: const EdgeInsets.only(bottom: 20),
                              isScrollable: true,

                              tabs: [
                            _customTabButton(text: 'Android D.',color: Colors.green),
                            _customTabButton(text: 'Web App D.',color: Colors.orange),
                            _customTabButton(text: 'G. Designer',color: Colors.blue),
                              ]
                            ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: List.generate(3, (tapIndex) {
                      return  ListView(
                        shrinkWrap: true,
                        children: List.generate(10, (listIndex) {
                          return CustomContainer(
                            margin: const EdgeInsets.only(bottom: 16,left: 20,right: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.1),
                                blurRadius: 05,
                                offset: const Offset(1, 1),
                              ),
                            ],
                            height: 100,
                            borderRound: 10,
                            width: double.maxFinite,
                            color: Colors.white,
                            child: Stack(
                              children: [
                                CustomContainer(
                                  margin: EdgeInsets.only(top: 16),
                                  height: 70,
                                  width: 70,
                                  borderRound: 10,
                                  decorationImage: DecorationImage(image: AssetImage(ebookProvider.profileImage[tapIndex]),fit: BoxFit.cover),
                                ),
                                const Positioned(
                                    top: 20,
                                    left: 85,
                                    child: CustomText(text: 'Mustakim Mokter',size: 16,fontWeight: FontWeight.bold,)
                                ),
                                const Positioned(
                                    top: 40,
                                    left: 85,
                                    child: CustomText(text: 'Flutter Developer',size: 14)
                                ),
                                Positioned(
                                    top: 60,
                                    left: 85,
                                    child: Row(
                                      children: const [
                                        CustomText(text: '4.5',size: 14),
                                        Icon(Icons.star,color: Colors.amberAccent,size: 18,)
                                      ],
                                    )
                                ),
                                Positioned(
                                    top: 16,
                                    left: 260,
                                    child: Column(
                                      children: const [
                                        CustomContainer(
                                          padding: EdgeInsets.all(05),
                                          color: Colors.amber,
                                          borderRound: 06,
                                          child: Icon(Icons.chat,color: Colors.white,size: 18,),
                                        ),
                                        SizedBox(height: 12),
                                        CustomContainer(
                                          padding: EdgeInsets.all(05),
                                          color: Colors.green,
                                          borderRound: 06,
                                          child: Icon(Icons.call,color: Colors.white,size: 18,),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          );
                        }),
                      );
                    }),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customTabButton({required String text, Color? color}){
    return  CustomContainer(
      borderRound: 5,
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: Offset(1, 1),
          blurRadius: 5,
        ),
      ],
      child: CustomText(text: text,size: 16,),
    );
  }

  Widget _ink (){
    return InkResponse(
      onTap: () {
      },
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xFFB8DD41),
        child: Icon(Icons.arrow_forward,color: Colors.white,size: 40),
      ),
    );
  }
}

