import 'package:flutter/material.dart';
import 'package:widget_practice_one/widgets/custom_button.dart';
import 'package:widget_practice_one/widgets/custom_container.dart';
import 'package:widget_practice_one/widgets/custom_text.dart';



class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(text: 'Shimmer Effect',),automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              title: 'GoToScreen',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>ShimmerEffectState()));
              },
            ),
          ],
        ),
      ),
    );
  }
}


class ShimmerEffectState extends StatefulWidget {
  const ShimmerEffectState({Key? key}) : super(key: key);

  @override
  State<ShimmerEffectState> createState() => _ShimmerEffectStateState();
}

class _ShimmerEffectStateState extends State<ShimmerEffectState> {

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
        (){
        setState(() {
          _isLoading = true;
        });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(text: 'Shimmer Effect',),backgroundColor: Colors.red,),
      body: _isLoading?  ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Row(
              children: [
                Image.asset('images/playstore.png',scale: 10,),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomText(text: 'Shimmer Effect'),
                      CustomText(
                        size: 15,
                        alignment: TextAlign.start,
                        textOverflow: TextOverflow.visible,
                        text: 'Text could be movies, scripts, paintings, songs, political cartoons, '
                          'advertisements and maps.',
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ) : _shimmerEffect(),
    );
  }

  Widget _shimmerEffect(){
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          child: Row(
            children: [
              CustomContainer(
                height: 70,
                width: 60,
                borderRound: 8,
                color: Colors.grey.shade200,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _effectContainer(160),
                    _effectContainer(200),
                    _effectContainer(300),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  
  Widget _effectContainer(double width){
    return CustomContainer(
      margin: EdgeInsets.only(bottom: 4.5,top: 4.5),
      width: width,
      height: 14,
      borderRound: 05,
      color: Colors.grey.shade200,
    );
  }
}
