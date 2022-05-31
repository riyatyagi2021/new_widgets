import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier{
  GoogleSignIn googleSignIn = GoogleSignIn();
 GoogleSignInAccount? userr;

 GoogleSignInAccount get User=>userr!;



  Future  signIn()async{
    var googleUser=await googleSignIn.signIn();
    if(userr==null) return;
    userr=googleUser;

    final googleAuth= await googleUser!.authentication;

    final credential=GoogleAuthProvider.credential(
        accessToken:googleAuth.accessToken ,
        idToken:googleAuth.idToken
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();

  }

}