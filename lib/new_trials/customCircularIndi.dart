import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatefulWidget {
  const CustomCircularIndicator({Key? key}) : super(key: key);

  @override
  _CustomCircularIndicatorState createState() => _CustomCircularIndicatorState();
}

class _CustomCircularIndicatorState extends State<CustomCircularIndicator> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Container(
        child: Column(
          children: [
            TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(seconds: 4),
                builder: (context, value, child) {
                  return Container(
                    width: 300,
                    height: 100,
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [
                                  0.0,
                                  0.8
                                ],
                                colors: [
                                  Colors.blue,
                                  Colors.grey.withAlpha(100)
                                ]).createShader(rect);
                          },
                          child: Container(
                              width: 300,
                              height: 100,
                             // color: Colors.red,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: Image.asset(
                                          "assets/images/pic.jpg")
                                          .image))
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Container(
              height: 600,
             // color: Colors.red,
              child: ListWheelScrollView(
                diameterRatio: 1,
                  itemExtent: 360,
                  children: List.generate(10, (index) => Container(
                      width: 300,height: 400,
                    margin: EdgeInsets.all(5),
                      child: Image.asset("assets/images/pic.jpg",)))
                  ),
            )],
        ),
      ),
    );
  }
}
