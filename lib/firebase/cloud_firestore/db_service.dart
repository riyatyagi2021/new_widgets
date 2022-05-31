

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String? uid;
  DatabaseService({this.uid});

final CollectionReference details=FirebaseFirestore.instance.collection("gh");

Future updateUserData(String name,String email,int mobile,int age) async{
  return await details.doc(uid).set(
      {'name': name,
        'email': email,
        'mobile': mobile,
        'age': age,}
  );
}

}