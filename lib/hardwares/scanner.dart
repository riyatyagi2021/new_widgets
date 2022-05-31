/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarQRScanner extends StatefulWidget {
  const BarQRScanner({Key? key}) : super(key: key);

  @override
  _BarQRScannerState createState() => _BarQRScannerState();
}

class _BarQRScannerState extends State<BarQRScanner> {
  String _scanBarcode = 'Unknown';

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (! mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => scanBarcodeNormal(),
                    child: const Text('Barcode scan')),
                ElevatedButton(
                    onPressed: () => scanQR(),
                    child: const Text('QR scan')),
                ElevatedButton(
                    onPressed: () => startBarcodeScanStream(),
                    child: const Text('Barcode scan stream')),
                Text('Scan result : $_scanBarcode\n',
                    style: const TextStyle(fontSize: 20)),
              ])
        ),
      ),
    );
  }


}
*/
