
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:trying_widgetss/hardwares/scanner.dart';
import 'package:trying_widgetss/hive/model/transaction.dart';
import 'package:trying_widgetss/hive/transaction_view.dart';
import 'package:trying_widgetss/video/video_call.dart';
import 'firebase/google_sign_in/googlebtn.dart';
import 'firebase/google_sign_in/googlesignin_provider.dart';
import 'hardwares/bluetooth.dart';
import 'hardwares/razorpay.dart';
import 'new_trials/chips/chip__testing.dart';
import 'new_trials/chips/chips.dart';
import 'new_trials/dropdown_country_api/dropdown.dart';
import 'new_trials/cached_network image.dart';
import 'new_trials/download_read_files.dart';
import 'new_trials/customCircularIndi.dart';
import 'new_trials/intercative_viewer.dart';
import 'new_trials/multiples.dart';
import 'new_trials/zoom_image.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    systemNavigationBarColor: Colors.green,

  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter()); //here pass the generated adapter
  await Hive.openBox<Transaction>('transactions');
  await Permission.camera.request();
  await Permission.microphone.request();


  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     //showPerformanceOverlay: true,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding:  EdgeInsets.symmetric(vertical: 50),
        color: Colors.yellow,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              CupertinoButton(
                  child: Text('Haptic Feedback'),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>BluetoothIntegration()));
                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('RazorPay Payments'),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>RazorPayIntegration()));
                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('Scanners'),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>TransactionPage()));//BarQRScanner
                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('Hive Storage'),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>TransactionPage()));
                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('Network cache images'),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>CacheNtwrkImages()));
                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('Download/Open any file Type'),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>DownloadReadFiles()));
                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('Zoom Image '),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>ZoomImage()));


                  }),
              SizedBox(height: 20,),

              CupertinoButton(
                  child: Text('CustomCircularIndicator '),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>CustomCircularIndicator()));
                  }),
              SizedBox(height: 20,),

              CupertinoButton(
                  child: Text('IntercativeViewer '),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>IntercativeViewer()));
                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('Dropdown '),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>Country()));
                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('MultipleWidgets '),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>MultipleWidgets()));
                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('Google SignIn'),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>Googlebtn()));

                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('Chips'),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>ChipTrial()));

                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('Search'),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>ChipTrial()));

                  }),
              SizedBox(height: 20,),
              CupertinoButton(
                  child: Text('Video Call'),
                  color: Colors.deepPurpleAccent,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>VideoCall()));

                  }),

            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
