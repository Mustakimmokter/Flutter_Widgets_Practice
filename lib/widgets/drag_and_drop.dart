import 'package:flutter/material.dart';
import 'package:widget_practice_one/widgets/custom_container.dart';
import 'package:widget_practice_one/widgets/custom_header.dart';

class DragAndDrop extends StatefulWidget {
  const DragAndDrop({Key? key}) : super(key: key);

  @override
  State<DragAndDrop> createState() => _DragAndDropState();
}

class _DragAndDropState extends State<DragAndDrop> {
  bool drag = false;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const CustomHeader(title: 'Drag and Drop'),
            Draggable(
              data: 'images/image-1.jpg',
              feedback: Image.asset('images/image-1.jpg',width: 100,),
              childWhenDragging: const CustomContainer(
                height: 100,
                width: 100,
                color: Colors.grey,
              ),
              child: Image.asset('images/image-1.jpg',width: 100,),
              onDragStarted: (){
                drag = true;
              },
              onDragEnd: (value){
                value.wasAccepted;
              },
              onDraggableCanceled: (velocity, offset) {

              },
            ),
            SizedBox(height: 200),
            DragTarget(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: 200,
                  width: 200,
                  color: Colors.grey,
                  child: imagePath != null? Image.asset(imagePath!): SizedBox(),
                );

            },
              onAccept: (data){
                setState(() {
                  imagePath = data.toString();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
