import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class HooksIntro extends HookWidget {
   HooksIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count=useState(0);
    final countValue=useState(0);

    useEffect((){
      final timer = Timer.periodic(Duration(seconds: 1), (timer) {
        countValue.value=timer.tick;      });
      return timer.cancel;
    },[]);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hooks Intro"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(" Tapped ${count.value} times"),
            Text(" Auto increment ${countValue.value} times"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            count.value++;
          },
          child: Text("Tap"),
        ),
      ),

    );
  }
}
