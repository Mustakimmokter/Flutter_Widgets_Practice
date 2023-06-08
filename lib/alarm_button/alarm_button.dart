import 'package:flutter/material.dart';

class AlarmButton extends StatelessWidget {
   AlarmButton({Key? key,required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  double size = 70;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size - 30,
      width: size + 30,
      child: MaterialButton(
        //splashColor: Colors.grey,
        highlightElevation: 0,
        elevation: 0,
        color: const Color(0xffe3e3e3),
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: const BorderSide(color: Colors.grey)
        ),
        child: Stack(
          children: [
             SizedBox(
              height: size / 2,
              width: size,
            ),
            const Positioned(
              top: 5,
              child: Icon(Icons.notifications_active_outlined,size: 22,),
            ),
            const Positioned(
              left: 20,
              top: 18,
              child: Text('2.5',style: TextStyle(fontSize: 20,color: Colors.grey),),
            ),
            Positioned(
              child: SizedBox(
                child: ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    height: 100,
                   decoration: BoxDecoration(
                     //color: Colors.green,
                     border: Border.all(width: 1),
                   ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    final path = Path();

    path.lineTo(0, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.height+ size.width);

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyPainter extends CustomPainter {
  MyPainter({this.ratio = 96});

  final double ratio;


  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine( Offset(ratio - 20,0),  Offset(-0, ratio / 2), Paint()..color = Colors.grey..strokeWidth = 1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CustomLinePainter extends CustomPainter {

  CustomLinePainter({required this.height});
  final double height;


  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    final paintOne = Offset(height, height / 8);
    final paintTwo = Offset(-height /  5.5, height / 2.4);
    print(height);
    /*
     final paintOne = Offset(s, 14);
    const paintTwo = Offset(-10, 47);
     */


    canvas.drawLine(paintOne, paintTwo, paint);
    print(size);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

/*
 child: Container(
        height: 60,
        width: 100,

        decoration: BoxDecoration(
          color: Color(0xffe3e3e3),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(100)
        ),
      ),
 */