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
      body: Center(
          child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 4),
              builder: (context, value, child) {
                return Container(
                  width: 500,
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
                                0.1
                              ],
                              colors: [
                                Colors.blue,
                                Colors.grey.withAlpha(100)
                              ]).createShader(rect);
                        },
                        child: Container(
                            width: 500,
                            height: 100,
                            color: Colors.red,
                            /*decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: Image.asset(
                                        "assets/images/audio_waveform.png")
                                        .image))*/
                        ),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
