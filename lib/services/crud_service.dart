import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection("User");

class FirebaseCrud {
  static Future<Response> addUser(String name, String email, int age,
      String phone) async {
    Response response = Response();
    DocumentReference documentReference = _collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
      "age": age,
      "phone": phone
    };

    var result = await documentReference.set(data).whenComplete(() {
      response.code = 200;
      response.message = "User added successfully!";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> getUsers() {
    CollectionReference notesItemCollection = _collection;
    return notesItemCollection.snapshots();
  }

  static Future<Response> deleteUser(String docId) async {
    Response response = Response();
    DocumentReference documentReference = _collection.doc(docId);

    await documentReference.delete().whenComplete(() {
      response.code = 200;
      response.message = "User deleted";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> updateUser(String docId, String name, String email,
      int age, String phone) async {
    Response response = Response();
    DocumentReference documentReference = _collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
      "age":age,
      "phone":phone
    };

    await documentReference.update(data).whenComplete(() {
      response.code = 200;
      response.message = "User updated!";
    }).catchError((e){
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<DocumentSnapshot<Object?>> getUser(String docId) async {
    DocumentReference documentReference = _collection.doc(docId);
    // var dataSnapshot;
    // await documentReference.get().then((snapshot){
    //   dataSnapshot = snapshot;
    // });
    // return dataSnapshot;
    return await documentReference.get();
  }

  // static Stream<QuerySnapshot> getUserById (String docId) async{
  //   CollectionReference collectionReference = _collection;
  //   QuerySnapshot data = _collection.where("");
  // }
}