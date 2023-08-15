import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection("User");

class FirebaseCrud{
  static Future<Response> addUser(String name, String email, int age, String phone) async{
    Response response = Response();
    DocumentReference documentReference = _collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email":email,
      "age":age,
      "phone":phone
    };

    var result = await documentReference.set(data).whenComplete((){
      response.code = 200;
      response.message = "User added successfully!";
    }).catchError(  (e){
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> getUsers(){
    CollectionReference notesItemCollection = _collection;
    return notesItemCollection.snapshots();
  }

  static Future<Response> deleteUser(String docId) async{
    Response response = Response();
    DocumentReference documentReference = _collection.doc(docId);

    await documentReference.delete().whenComplete((){
      response.code = 200;
      response.message = "User deleted";
    }).catchError((e){
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}