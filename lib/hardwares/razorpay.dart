import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayIntegration extends StatefulWidget {
  const RazorPayIntegration({Key? key}) : super(key: key);

  @override
  _RazorPayIntegrationState createState() => _RazorPayIntegrationState();
}

class _RazorPayIntegrationState extends State<RazorPayIntegration> {
  Razorpay razorpay=Razorpay();
  TextEditingController amount=TextEditingController();

  @override
  void initState() {
    super.initState();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS ");
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR ");
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET");
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_yaCZOAzPbE86ut',
      'amount': num.parse(amount.text)*100,
      'name': 'Riya Tyagi',
      'description': 'Payment',
      'prefill': {
        'contact': '7409616828',
        'email': 'riya@razorpay.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint("${e.toString()}  errrorrrrrrrr???");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                 controller: amount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter the amount you want to pay"
                  ),
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: (){
                openCheckout();
              },
                  child: Text("Pay Now"))
            ],
          ),
        ),
      ),
    );
  }
}
