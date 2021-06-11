import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:job/widget/crop/controllers/controller.dart';
import 'package:job/widget/crop/models/model.dart';
import 'package:job/widget/crop/widgets/custom_image_crop_widget.dart';


class CropView extends StatefulWidget {
  final String title;

  CropView({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  _CropViewState createState() => _CropViewState();
}

class _CropViewState extends State<CropView> {
  CustomImageCropController controller;
  double sliderValue=1;
  bool finishCrop=false;
  MemoryImage image ;

  @override
  void initState() {
    super.initState();
    controller = CustomImageCropController();


  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        brightness: Brightness.dark,
      ),
      body: Column(
        children: [

         finishCrop?
      Expanded(
      child:Image(image: image,)): Expanded(
            child: CustomImageCrop(
              cropPercentage: 0.3,
              shape: CustomCropShape.Square,
              cropController: controller,
              image: finishCrop && image!=null ?image :const AssetImage('assets/test.jpg'),
            ),
          ),
          Visibility(
              visible: !finishCrop,
              child:  Slider(
            onChanged: (value){
              controller.cropImageData.scale=value/10;

            setState(() {
              sliderValue=value;
            });

          },value: sliderValue,

          min: 1,max: 20,
          )),
ElevatedButton(
  style: ButtonStyle( backgroundColor:MaterialStateProperty.all<Color>(
      finishCrop?Colors.blue:Colors.grey)),
  child: Text('crop'),onPressed: () async{

  MemoryImage finalImage;
  if(!finishCrop) {
    finalImage  = await controller.onCropImage();

  }

setState(() {
  image=finalImage;
  finishCrop=!finishCrop;
});

},) ,SizedBox(height: MediaQuery.of(context).padding.bottom),

            ],
          ),

    );
  }
}