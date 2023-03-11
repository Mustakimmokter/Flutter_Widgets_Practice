import 'package:flutter/material.dart';
import 'package:widget_practice_one/widgets/index.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoLoad extends StatefulWidget {
  const YouTubeVideoLoad({Key? key}) : super(key: key);

  @override
  State<YouTubeVideoLoad> createState() => _YouTubeVideoLoadState();
}

class _YouTubeVideoLoadState extends State<YouTubeVideoLoad> {

  YoutubePlayerController? _controller;

  List<String> videoIDList =[];
  List<String> videoLink = [
    'https://www.youtube.com/watch?v=7Sk1zhNEW2k&list=RD7Sk1zhNEW2k&start_radio=1',
    'https://www.youtube.com/watch?v=BBAyRBTfsOU',
    'https://www.youtube.com/watch?v=80-kyzvSoDA&list=RD7Sk1zhNEW2k&index=6'
  ];

  @override
  void initState() {
    super.initState();

      for(int a = 0; a < videoLink.length; a++){
        videoIDList.add(
          YoutubePlayer.convertUrlToId(videoLink[a]).toString()
        );
      }


    if(videoIDList != null){
      setState(() {
        _controller = YoutubePlayerController(
          initialVideoId: videoIDList[0],
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            //mute: true,
          ),
        );
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.maxFinite,
          ),
          videoIDList.isNotEmpty?
          Container(
            child: YoutubePlayer(
              controller: _controller!,
              showVideoProgressIndicator: true,
              onReady: () {
                _controller!.play();
              },
            ),
          )
                  : SizedBox(),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: videoIDList.isNotEmpty ? videoIDList.length : 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: CustomText(text: '${index+1}',),),
                    onTap: (){
                      _controller!.load(videoIDList[index]);
                    },
                  );
                },
    ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
