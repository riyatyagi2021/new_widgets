import 'package:flutter/material.dart';

class IntercativeViewer extends StatefulWidget {
  const IntercativeViewer({Key? key}) : super(key: key);

  @override
  _IntercativeViewerState createState() => _IntercativeViewerState();
}

class _IntercativeViewerState extends State<IntercativeViewer> with TickerProviderStateMixin {
  final controller = TransformationController();
  AnimationController? controllerReset;

  @override
  void initState() {
    super.initState();

    controllerReset = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    // controller.addListener(() {
    //   if (controller.value.getMaxScaleOnAxis() >= 3) {
    //     print('Scale >= 3.0');
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Interactive viewer"),
      actions: [
        IconButton(
          icon: Icon(Icons.restore),
          onPressed: reset,
        ),
      ],
    ),
    body: InteractiveViewer(
      //boundaryMargin: EdgeInsets.all(20),
      minScale: 0.5,
      maxScale: 4,
      //scaleEnabled: false,
      //constrained: false,
      //onInteractionStart: (details) => print('Start interaction'),
      //onInteractionUpdate: (details) => print('Update interaction'),
      onInteractionEnd: (details) {
        print('End interaction');
        reset();
      },
      transformationController: controller,

      child: Image.network(
        'https://images.unsplash.com/photo-1600021775152-2c0b74b5d94b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      ),
    ),
  );

  void reset() {
    final animationReset = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(controllerReset!);

    animationReset.addListener(() {
      setState(() {
        controller.value = animationReset.value;
      });
    });

    controllerReset?.reset();
    controllerReset?.forward();

    // setState(() {
    //   controller.value = Matrix4.identity();
    // });
  }
}
