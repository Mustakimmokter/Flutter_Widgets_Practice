import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:widget_practice_one/widgets/custom_container.dart';
import 'package:widget_practice_one/widgets/custom_text.dart';

class GoogleMapsLocation extends StatefulWidget {
  const GoogleMapsLocation({Key? key}) : super(key: key);

  @override
  State<GoogleMapsLocation> createState() => _GoogleMapsLocationState();
}

class _GoogleMapsLocationState extends State<GoogleMapsLocation> {
  final TextEditingController _textEditingController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  Location location = Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  String? searchValue;
  final Set<Marker> _marker = {};


  void addMarker (){
    setState(() {
      _marker.add(
        Marker(
          markerId: MarkerId('current-location'),
          position: LatLng(_locationData!.latitude!.toDouble(), _locationData!.longitude!.toDouble()),
          icon: BitmapDescriptor.defaultMarker,
        )
      );
    });
  }

  Future<dynamic> getLocation()async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {

    });
    print(_locationData!.latitude);

  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
           // SizedBox(
           //   height: size.height,
           // ),
           Positioned(
             left: 0,
             right: 0,
             child: Column(
               children: [
                 CustomContainer(
                   height: 100,
                   padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                   color: Colors.green,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(
                         height: 40,
                         width: size.width / 1.3,
                         child: TextField(
                           controller: _textEditingController,
                           textCapitalization: TextCapitalization.words,
                           cursorColor: Colors.black38,
                           decoration: InputDecoration(
                             fillColor: Colors.white.withOpacity(.3),
                             filled: true,
                             hintText: 'Enter you location',
                             contentPadding: EdgeInsets.only(left: 14),
                             border: OutlineInputBorder(
                               borderSide: BorderSide.none,
                               borderRadius: BorderRadius.circular(100),
                             ),
                           ),
                           onChanged: (value){
                             value = _textEditingController.text;
                           },
                         ),
                       ),
                       InkResponse(
                         child: Icon(Icons.search,color: Colors.white.withOpacity(.5),size: 30,),
                         onTap: (){
                             if(_textEditingController.text.isNotEmpty && _textEditingController != null){
                               setState(() {
                                 searchValue = _textEditingController.text;
                                 print(searchValue);
                               });
                             }else{
                               setState(() {
                                 searchValue = '';
                               });
                               const snackBar = SnackBar(
                                 content: CustomText(text: 'Write your location first',size: 16,),
                                 duration: Duration(seconds: 1),
                               );
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             }
                         },
                       ),
                     ],
                   ),
                 ),
                 if(searchValue != null && searchValue!.isNotEmpty)
                   CustomContainer(
                     padding: EdgeInsets.all(0),
                     height: 30,
                     child: CustomText(text: searchValue!,size: 16,),
                   ),
               ],
             ),
           ),
            Positioned(
              left: 0,
              right: 0,
              top: size.height / 7.7,
              bottom: 0,
              child: _locationData != null? GoogleMap(
                mapType: MapType.normal,
                markers: _marker,
                initialCameraPosition:  CameraPosition(
                  target: LatLng(_locationData!.latitude!.toDouble(), _locationData!.longitude!.toDouble()),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  addMarker();
                },
              ) : Center(child: CircularProgressIndicator(),),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: size.height / 7.8,
              child: searchValue != null && searchValue!.isNotEmpty?
              CustomContainer(
                padding: EdgeInsets.all(0),
                height: 30,
                child: CustomText(text: searchValue!,size: 16,),
              ): SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
