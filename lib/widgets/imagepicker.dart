import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice_one/iu/show_widgets/provider/provider.dart';
import 'package:widget_practice_one/widgets/index.dart';

class ImagePickerMuliImages extends StatefulWidget {
  const ImagePickerMuliImages({Key? key}) : super(key: key);

  @override
  State<ImagePickerMuliImages> createState() => _ImagePickerMuliImagesState();
}

class _ImagePickerMuliImagesState extends State<ImagePickerMuliImages> {

  final _picker = ImagePicker();

  XFile? image;
  List<XFile>? images;
  int pageNum = 0;

  Future<void> getImage(String value)async{
    if(value == 'multi'){
      images = await _picker.pickMultiImage();
      setState(() {

      });
    }else if(value == 'single'){
      image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final widgetsProvider = Provider.of<WidgetsProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: image == null ? CustomText(text: 'ImageNot Selected',):
                  Image.file(File(image!.path),fit: BoxFit.cover,height: 250,width: 180,),
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                title: 'SingleImage',
                onTap: (){
                  getImage('single');
                },
              ),
              Divider(),
              SizedBox(
                height: 260,
                width: double.maxFinite,
                child: PageView.builder(
                  itemCount: images != null ? images!.length : 0,
                  controller: PageController(initialPage: pageNum,viewportFraction: .6),
                  onPageChanged: (value){
                    pageNum = value;
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: images == null ? const Center(child: CustomText(text: 'Image Not Selected',),) :
                        Image.file(File(images![index].path),fit: BoxFit.cover,width: 180,height: 250,),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              CustomButton(
                title: 'MultiImage',
                onTap: (){
                  getImage('multi');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
