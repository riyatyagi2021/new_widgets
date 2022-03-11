import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BluetoothIntegration extends StatefulWidget {
  const BluetoothIntegration({Key? key}) : super(key: key);

  @override
  _BluetoothIntegrationState createState() => _BluetoothIntegrationState();
}

class _BluetoothIntegrationState extends State<BluetoothIntegration> {


  // var scanDevices=flutterBlueObj.scan().listen((scanResults) {
  // });

 // scanDevices.cancel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: (){
                 HapticFeedback.lightImpact();

                  },
                  icon: Icon(Icons.feedback))
            ],
          ),
        ),
      ),
    );
  }
}
