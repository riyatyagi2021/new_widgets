import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trying_widgetss/firebase/cloud_firestore/db_service.dart';
import 'package:trying_widgetss/new_trials/multiples.dart';
import 'dart:io';

class DetailedPage extends StatefulWidget {
 final User? user;
  const DetailedPage({Key? key,this.user}) : super(key: key);

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
 static var userr= FirebaseAuth.instance.currentUser;
  GoogleSignIn googleSignIn = GoogleSignIn();
  final mobile=TextEditingController();
  final age=TextEditingController();


 String photo=userr!.photoURL.toString();
 var pic=File(userr!.photoURL.toString());

 Future<String> uploadFile() async{
  // File file = await toFile(photo);
   final Reference storageReference =
   FirebaseStorage.instance.ref().child("Google Pic");

   print(pic);
   TaskSnapshot taskSnapshot = await
   storageReference.putFile(pic);

   print("${taskSnapshot}   jhgfdfghjkhgfgh");
   var downloadUrl = await taskSnapshot.ref.getDownloadURL();

   return downloadUrl;
 }


  void signOut() {
    googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    print("user signed out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 50),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ElevatedButton(onPressed: (){
                signOut();
                Navigator.pop(context);
              }, child: Text("Logout")),
              CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage("${userr!.photoURL}"),
              ),
              Text("Details"),
              Text("Email        "+widget.user!.email.toString()),
              Text("Name     "+widget.user!.displayName.toString()),
              Text("URL     "+widget.user!.photoURL.toString()),
              TextField(
                controller:mobile ,
                decoration: InputDecoration(
                  hintText: "enter mobile number"
                ),
              ) ,
              TextField(
                controller:age ,
                decoration: InputDecoration(
                  hintText: "enter age"
                ),
              ),
              ElevatedButton(onPressed: () async{
                     await DatabaseService(uid: userr!.uid)
                         .updateUserData("${userr!.displayName}", "${userr!.email}", int.parse(mobile.text), int.parse(age.text));
                    uploadFile();
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder:(context)=>MultipleWidgets()));
              }, child: Text("Next page"))
            ],
          ),
        ),
      ),
    );
  }
}
