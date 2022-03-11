import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trying_widgetss/hardwares/scanner.dart';
import 'package:trying_widgetss/hive/model/transaction.dart';
import 'package:trying_widgetss/hive/transaction_view.dart';

import 'hardwares/bluetooth.dart';
import 'hardwares/razorpay.dart';
import 'new_trials/cached_network image.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter()); //here pass the generated adapter
  await Hive.openBox<Transaction>('transactions');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('New Widgetss'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 50),
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            CupertinoButton(
                child: Text('BlueTooth'),
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
                      MaterialPageRoute(builder:(context)=>BarQRScanner()));
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
                child: Text('Network cache images'),
                color: Colors.deepPurpleAccent,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>CacheNtwrkImages()));
                }),



          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
