import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MultipleWidgets extends StatefulWidget {
  const MultipleWidgets({Key? key}) : super(key: key);

  @override
  _MultipleWidgetsState createState() => _MultipleWidgetsState();
}

class _MultipleWidgetsState extends State<MultipleWidgets> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New New"),
      ),
      body: Scrollbar(
        child: Container(
         // color: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 Tooltip(
                 child: Text("Helllo Riya!Row as its child that aligns all its children widgets in the center. After that, we have created a Container with some padding and inside that,"
                " we have the widget Tooltip. Now,"
                " the Tooltip widget is taking Text as its child that prints a stri"
                "ng on the screen. When we use Tooltip, the message property is a must provide, and in"
                " this case, it is ‘Test’. And similar to the menu icon when the text is hovered or long p"),
                  message: "This text is of no use"
                   ),

                IndexedStack(
                  index: index,
                  children: [
                    Image.asset('assets/images/pic.jpg',),
                    Text("kjhgfdsfgh"),
                    Image.asset('assets/images/pic.jpg',),
                    Text("kjhgfdsfgh"),
                    Image.asset('assets/images/pic.jpg'),
                    Text("kjhgfdsfgh"),
                    Image.asset('assets/images/pic.jpg'),
                    Text("kjhgfdsfgh"),
                    Image.asset('assets/images/pic.jpg'),
                    Text("kjhgfdsfgh"),
                    Image.asset('assets/images/pic.jpg'),
                  ],
                ),
                ElevatedButton(onPressed:
                    (){
                  setState(() {
                    if(index<=9){
                      index=index+1;
                    }else{
                      Fluttertoast.showToast(msg: "Only 9 are there");
                    }
                  }
                  );
                  bottomsheet();
                }, child: Text("Change index")),

                ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorDodge),
                child:  Image.asset('assets/images/pic.jpg'),),
                ElevatedButton(onPressed:
                    (){
                  bottomsheet();
                }, child: Text("open btsmsheet")),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                    child: Container(
                        child: Image.asset('assets/images/pic.jpg')),
                  ),
                )



              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget bottomsheet()=>  CupertinoActionSheet(
    title: Text('Hellllo'),
    actions: [
      CupertinoActionSheetAction(
          onPressed: (){},
          child: Text("GM"))
      ,CupertinoActionSheetAction(
          onPressed: (){},
          child: Text("GE")),
      CupertinoActionSheetAction(
          onPressed: (){},
          child: Text("GN"))
    ],
  );
}
