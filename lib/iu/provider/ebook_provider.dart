
import 'package:flutter/material.dart';


class EbookProvider extends ChangeNotifier {


  final List<String> _profileImage = [
    'images/image-1.jpg',
    'images/image-2.png',
    'images/image-3.jpg',
  ];
  final List<String> _teamImage = [
    'images/team_image_2.jpg',
    'images/team_image_3.jpg',
   'images/team_image_1.jpg',
   'images/team_image_4.jpg',
   'images/team_image_5.jpg'
  ];

  List<String> get profileImage => _profileImage;
  List<String> get teamImage => _teamImage;


}
