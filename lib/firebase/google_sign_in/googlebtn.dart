import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:trying_widgetss/firebase/google_sign_in/googlesignin_provider.dart';

import 'detailed_page.dart';

class Googlebtn extends StatefulWidget {
  const Googlebtn({Key? key}) : super(key: key);

  @override
  _GooglebtnState createState() => _GooglebtnState();
}

class _GooglebtnState extends State<Googlebtn> {
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future <User> signIn()async{
    GoogleSignInAccount? googleUser=await googleSignIn.signIn();

    final googleAuth= await googleUser!.authentication;

    final credential=GoogleAuthProvider.credential(
        accessToken:googleAuth.accessToken ,
        idToken:googleAuth.idToken
    );
   UserCredential authResult= await FirebaseAuth.instance.signInWithCredential(credential);
    User? user = await authResult.user;
    return user!;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
           signIn().then((user) {
             if(user!=null){
               Navigator.push(
                   context,
                   MaterialPageRoute(builder:(context)=>DetailedPage(user:user)));
             }else{
               Fluttertoast.showToast(msg: "Need to check");
             }
           });
          },
          child: Text("Sign in"),
        ),
      ),
    );
  }

}
