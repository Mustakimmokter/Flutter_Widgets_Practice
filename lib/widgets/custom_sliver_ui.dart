import 'package:flutter/material.dart';
import 'package:widget_practice_one/widgets/index.dart';

class CustomSliverUi extends StatelessWidget {
  const CustomSliverUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 300,
            floating: true,
            pinned: true,
            //automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KRoundedButton(onTap: (){}, icon: Icons.arrow_back,),
                CustomText(text: 'Custom Scroll View'),
                KRoundedButton(onTap: (){}, icon: Icons.shopping_cart_outlined),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/bgnd_2.png',fit: BoxFit.cover,),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(60),
              child:  CustomContainer(
              color: Colors.white,
              height: 60,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search here'
                ),
              ),
            ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index){
                    return const CustomContainer(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                      height: 70,
                      borderRound: 10,
                      color: Colors.green,
                      child: CustomText(text: 'Practice CustomScroll View',color: Colors.white,),
                    );
                  },
              childCount: 10,
            ),

          ),
          const SliverToBoxAdapter(
            child: CustomContainer(
              margin: EdgeInsets.only(top: 20),
              height: 60,
              color: Colors.red,
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(10, (index) {
              return const CustomContainer(
                margin: EdgeInsets.only(top: 10),
                height: 100,
                color: Colors.red,
              );
            }),
          ),
          const SliverToBoxAdapter(
            child: CustomContainer(
              margin: EdgeInsets.only(top: 20),
              height: 200,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
