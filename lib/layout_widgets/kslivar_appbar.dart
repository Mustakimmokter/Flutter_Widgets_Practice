import 'package:flutter/material.dart';
import 'package:widget_practice_one/layout_widgets/sliver_animation.dart';
import 'package:widget_practice_one/utils/utils.dart';
import 'package:widget_practice_one/widgets/index.dart';

class KSliverAppbar extends StatelessWidget {
  const KSliverAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KRoundedButton(
                    onTap: (){},
                    icon: Icons.arrow_back_ios,
                ),
                const CustomText(text: 'Travel'),
                KRoundedButton(
                    onTap: (){},
                    icon: Icons.search,
                ),
              ],
            ),
            backgroundColor: primaryBrandColor,
            expandedHeight: 260,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/bgnd_1.jpg',fit: BoxFit.cover,),
            ),


          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText(
                    text: 'Description:',
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    alignment: TextAlign.left,
                    size: 15,
                    textOverflow: TextOverflow.visible,
                    text: 'Text could be movies, scripts, paintings, songs, political cartoons, '
                      'advertisements and maps. If we can look at something with words and sentences, '
                      'explore it, find layers of meaning in it, and draw information and conclusions '
                      'from it, you\'re looking at a text.'
                      'Text could be movies, scripts, paintings, songs, political cartoons, '
                      'advertisements and maps. If we can look at something with words and sentences, '
                      'explore it, find layers of meaning in it, and draw information and conclusions '
                      'from it, you\'re looking at a text.'
                      'Text could be movies, scripts, paintings, songs, political cartoons, '
                      'advertisements and maps. If we can look at something with words and sentences, '
                      'explore it, find layers of meaning in it, and draw information and conclusions '
                      'from it, you\'re looking at a text.'
                      'Text could be movies, scripts, paintings, songs, political cartoons, '
                      'advertisements and maps. If we can look at something with words and sentences, '
                      'explore it, find layers of meaning in it, and draw information and conclusions '
                      'from it, you\'re looking at a text.'
                      'Text could be movies, scripts, paintings, songs, political cartoons, '
                      'advertisements and maps. If we can look at something with words and sentences, '
                      'explore it, find layers of meaning in it, and draw information and conclusions '
                      'from it, you\'re looking at a text.'
                      'Text could be movies, scripts, paintings, songs, political cartoons, '
                      'advertisements and maps. If we can look at something with words and sentences, '
                      'explore it, find layers of meaning in it, and draw information and conclusions '
                      'from it, you\'re looking at a text.'
                      'Text could be movies, scripts, paintings, songs, political cartoons, '
                      'advertisements and maps. If we can look at something with words and sentences, '
                      'explore it, find layers of meaning in it, and draw information and conclusions '
                      'from it, you\'re looking at a text.'
                      'Text could be movies, scripts, paintings, songs, political cartoons, '
                      'advertisements and maps. If we can look at something with words and sentences, '
                      'explore it, find layers of meaning in it, and draw information and conclusions '
                      'from it, you\'re looking at a text.'
                      'Text could be movies, scripts, paintings, songs, political cartoons, '
                      'advertisements and maps. If we can look at something with words and sentences, '
                      'explore it, find layers of meaning in it, and draw information and conclusions '
                      'from it, you\'re looking at a text.'
                      'Text could be movies, scripts, paintings, songs, political cartoons, '
                      'advertisements and maps. If we can look at something with words and sentences, '
                      'explore it, find layers of meaning in it, and draw information and conclusions '
                      'from it, you\'re looking at a text.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const KSliverAnimation()));
        },
        child: const CustomContainer(
          height: 60,
            color: primaryBrandColor,
            child: CustomText(text: 'Continue',color: Colors.white,),
          ),
      ),

    );
  }
}
