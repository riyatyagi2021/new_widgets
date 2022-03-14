import 'package:flutter/material.dart';

class ZoomImage extends StatefulWidget {
  const ZoomImage({Key? key}) : super(key: key);

  @override
  _ZoomImageState createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
 late TransformationController controller;

  @override
  void initState() {
    super.initState();
    controller=TransformationController();
  }

  @override
  void dispose() {
controller.dispose();
super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: buildImage(),
        ),
      ),
    );
  }

 Widget buildImage()=>GestureDetector(
   onTap: (){
     final double scale=2;
     final zoom=Matrix4.identity()..scale(scale);
     final value=zoom;
       controller.value=value;

   },
   child: InteractiveViewer(
     transformationController: controller,
     clipBehavior:Clip.none ,
     panEnabled:false ,
     scaleEnabled: false,
     child: Image.network('https://picsum.photos/200'),
     
   ),
 );
}
