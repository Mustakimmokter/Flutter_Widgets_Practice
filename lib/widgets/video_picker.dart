// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';
// import 'package:widget_practice_one/widgets/index.dart';
//
// class VideoPickerMulti extends StatefulWidget {
//   const VideoPickerMulti({Key? key}) : super(key: key);
//
//   @override
//   State<VideoPickerMulti> createState() => _VideoPickerMultiState();
// }
//
// class _VideoPickerMultiState extends State<VideoPickerMulti> {
//
//   VideoPlayerController? _videoPlayerController;
//
//   final _picker = ImagePicker();
//
//   XFile? image;
//   List<XFile>? images;
//   int pageNum = 0;
//
//   Future<void> getImage(String value)async{
//     if(value == 'multi'){
//       images = await _picker.pickMultiImage();
//       setState(() {
//
//       });
//     }else if(value == 'single'){
//       setState(() {
//         _videoPlayerController.
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Video Picker'),),
//       body: SizedBox(
//         child: Column(
//           children: [
//             Center(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: image == null ? CustomText(text: 'ImageNot Selected',):
//                 Image.file(File(image!.path),fit: BoxFit.cover,height: 250,width: 180,),
//               ),
//             ),
//             const SizedBox(height: 10),
//             CustomButton(
//               title: 'SingleImage',
//               onTap: (){
//                 getImage('single');
//               },
//             ),
//             Divider(),
//             SizedBox(
//               height: 260,
//               width: double.maxFinite,
//               child: PageView.builder(
//                 itemCount: images != null ? images!.length : 0,
//                 controller: PageController(initialPage: pageNum,viewportFraction: .6),
//                 onPageChanged: (value){
//                   pageNum = value;
//                 },
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: images == null ? const Center(child: CustomText(text: 'Image Not Selected',),) :
//                       Image.file(File(images![index].path),fit: BoxFit.cover,width: 180,height: 250,),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 10),
//             CustomButton(
//               title: 'MultiImage',
//               onTap: (){
//                 getImage('multi');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:widget_practice_one/widgets/custom_container.dart';


/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;


  final _videoPicker = ImagePicker();
  XFile? _video;
  double? _start;


  Future<void> videoPick()async{
      _video = await _videoPicker.pickVideo(source: ImageSource.gallery);
      setState(() {

      });
      if(_video != null){
        getVideo();
      }
  }

  @override
  void initState() {
    super.initState();
    // if(_videoController != null){
    //
    //   _videoController!.addListener(() {
    //     setState(() {});
    //   });
    //   _videoController!.setLooping(true);
    //   _videoController!.initialize().then((_) => setState(() {}));
    // }

  }


  void getVideo(){
    if(_video != null){
      _videoController = VideoPlayerController.file(File(_video!.path),)..initialize().then((_) {
        setState(() {
          // _videoController!.play();
          _chewieController = ChewieController(
            videoPlayerController: _videoController!,
            // aspectRatio: 2/3,
            autoPlay: false,
            //showControlsOnInitialize: true,
            looping: false,
            allowMuting: true,
            showControls: true,
            // materialProgressColors: ChewieProgressColors(
            //   playedColor: Colors.pink,
            //   handleColor: Colors.blue,
            //   backgroundColor: Colors.grey,
            //   bufferedColor: Colors.lightGreen,
            // ),
            // subtitle: Subtitles([
            //   Subtitle(index: 0, start: const Duration(seconds: 3), end: const Duration(seconds: 4), text: 'Your Subtle'),
            // ]),
            additionalOptions: (context) {
              return <OptionItem>[
                OptionItem(
                  onTap: () => debugPrint('My option works!'),
                  iconData: Icons.chat,
                  title: 'My localized title',
                ),
                OptionItem(
                  onTap: () =>
                      debugPrint('Another option working!'),
                  iconData: Icons.chat,
                  title: 'Another localized title',
                ),
              ];
            },
            zoomAndPan: true,
            allowFullScreen: true,
            allowPlaybackSpeedChanging: true,
            // cupertinoProgressColors: ChewieProgressColors(
            //   handleColor: Colors.red,
            //   playedColor: Colors.grey,
            //   bufferedColor: Colors.transparent,
            // ),
            placeholder: const CustomContainer(
              //padding: EdgeInsets.symmetric(horizontal: 20),
              // height: 250,
              // width: 240,
              borderRound: 10,
              color: Colors.grey,
            ),
            autoInitialize: true,
          );
        });
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            children: [
              _chewieController != null
                  ? SizedBox(
                // //padding: EdgeInsets.all(10),
                height:250 ,
                width: 240,
                // borderRound: 20,
                // boxBorder: Border.all(color: Colors.grey,width: 05),
                child: Chewie(controller: _chewieController!),
              )
                  : CustomContainer(
                height: 250,
                width: 200,
                borderRound: 10,
                boxBorder: Border.all(color: Colors.red,width: 05),
                child: Text('Not selected'),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      getVideo();
                    },
                    child: Icon(
                      _videoController != null ? _videoController!.value.isPlaying? Icons.play_arrow : Icons.pause: Icons.play_arrow,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if(_videoController!.value.isPlaying){
                        _videoController!.pause();
                      }else{
                        _videoController!.play();
                      }
                    },
                    child: Icon(
                      _videoController != null ? _videoController!.value.isPlaying? Icons.pause : Icons.play_arrow : Icons.play_arrow,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      videoPick();
                    },
                    child: Icon(Icons.video_collection),
                  ),
                ],
              ),
              ActionChip(label: Text('sdfdsf'),avatar: CircleAvatar(),
                  onPressed: (){

              },
                autofocus: false,
              ),
            ],
          ),
        ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoController!.dispose();
  }
}

/// Two

// class ViewDemo extends StatefulWidget {
//   const ViewDemo({super.key});
//
//
//   @override
//   State<StatefulWidget> createState() {
//     return _ChewieDemoState();
//   }
// }
//
// class _ChewieDemoState extends State<ViewDemo> {
//
//   VideoPlayerController? _videoController;
//   ChewieController? _chewieController;
//   final _videoPicker = ImagePicker();
//   XFile? _video;
//
//   @override
//   void initState() {
//     super.initState();
//     if(_video != null){
//       _videoController = VideoPlayerController.file(File(_video!.path));
//     }
//
//     if(_videoController != null){
//
//           _videoController!.addListener(() {
//             setState(() {});
//           });
//           _videoController!.setLooping(true);
//           _videoController!.initialize().then((_) => setState(() {}));
//           _videoController!.play();
//         }
//
//     if(_chewieController != null){
//       _chewieController = ChewieController(
//         videoPlayerController: _videoController!,
//         aspectRatio: 3 / 2,
//         autoPlay: true,
//         looping: false,
//         showControls: true,
//         materialProgressColors: ChewieProgressColors(
//           playedColor: Colors.pink,
//           handleColor: Colors.blue,
//           backgroundColor: Colors.grey,
//           bufferedColor: Colors.lightGreen,
//         ),
//
//         allowFullScreen: true,
//         placeholder: Container(
//           color: Colors.green,
//         ),
//         autoInitialize: true,
//       );
//     }
//   }
//
//   Future<void> pickVideo()async{
//     if(_videoPicker != null){
//       _video = await _videoPicker.pickVideo(source: ImageSource.gallery);
//       setState(() {
//       });
//     }
//     print(_video!.path);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Video Demo'),
//         ),
//         body: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 200,
//               width: 300,
//               child: Center(
//                 child: _chewieController != null? Chewie(
//                   controller: _chewieController!,
//                 ) : SizedBox(),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 pickVideo();
//               },
//               child: const Text('Gallery'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _chewieController!.play();
//
//                   _chewieController = ChewieController(
//                     videoPlayerController: _videoController!,
//                     aspectRatio: 3 / 2,
//                     autoPlay: false,
//                     looping: true,
//                   );
//
//                   _videoController!
//                     ..initialize().then((_) {
//                       setState(() {
//                         _videoController!
//                             .seekTo(Duration(seconds: 0));
//                         _videoController!.play();
//                       });
//                     });
//                 });
//               },
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                 child: Text("Seek To"),
//               ),
//             ),
//           ],
//         ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _videoController!.dispose();
//     _chewieController!.dispose();
//     super.dispose();
//   }
// }
