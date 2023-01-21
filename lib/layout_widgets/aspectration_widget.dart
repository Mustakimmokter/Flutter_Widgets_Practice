import 'package:flutter/material.dart';

class AspectRationWidget extends StatefulWidget {
  const AspectRationWidget({Key? key}) : super(key: key);

  @override
  State<AspectRationWidget> createState() => _AspectRationWidgetState();
}

class _AspectRationWidgetState extends State<AspectRationWidget> {

  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ClipPath(
              clipper: CustomShape(
              ),
              child: Container(
                height: 300,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Colors.red,
                    Colors.blue,
                  ])
                ),
                child:   Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 5,color: Colors.white),
                    image: const DecorationImage(image: AssetImage('images/bgnd_1.jpg'),fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.height / 3.6,
              top: 160,
              child:  Container(
              margin: const EdgeInsets.all(10),
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                border: Border.all(width: 5,color: Colors.white),
                image: const DecorationImage(image: AssetImage('images/image-1.jpg'),
                    fit: BoxFit.cover,
                ),
              ),
            ),),
            Positioned(
              left: 0,
              right: 0,
              top: 350,
                child: Table(border: TableBorder.all(),
                  defaultColumnWidth: const FixedColumnWidth(260),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(160),
                  },
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 32,
                          color: Colors.green,
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Container(
                            height: 40,
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          height: 64,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      children: <Widget>[
                        Container(
                          height: 64,
                          width: 128,
                          color: Colors.purple,
                        ),
                        Container(
                          height: 32,
                          color: Colors.yellow,
                        ),
                        Center(
                          child: Container(
                            height: 32,
                            width: 32,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          height: 64,
                          width: 128,
                          color: Colors.purple,
                        ),
                        Container(
                          height: 32,
                          color: Colors.yellow,
                        ),
                        Center(
                          child: Container(
                            height: 32,
                            width: 32,
                            color: Colors.orange,
                          ),
                        ),
                      ]
                    )
                  ],
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            isTrue =! isTrue;
          });
        },
        child: const Icon(Icons.add),),
    );
  }
}


class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    final path = Path();

    path.lineTo(0, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }
}
