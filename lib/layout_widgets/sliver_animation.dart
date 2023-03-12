import 'package:flutter/material.dart';
import 'package:widget_practice_one/utils/utils.dart';
import 'package:widget_practice_one/widgets/index.dart';

class KSliverAnimation extends StatelessWidget {
  const KSliverAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
           automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: 260,
            backgroundColor: Colors.amber,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               KRoundedButton(
                 color: Colors.amber,
                   onTap: (){
                     Navigator.pop(context);
                     print('object');
                   },
                   icon: Icons.arrow_back_ios),
                const CustomText(text: 'Travel'),
                KRoundedButton(
                  color: Colors.amber,
                    onTap: (){},
                    icon: Icons.search),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/bgnd_2.png',fit: BoxFit.cover,),
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
                    fontWeight: FontWeight.normal,
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
    );
  }
}
