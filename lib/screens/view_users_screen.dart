import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/response.dart';
import 'package:firebase_app/services/crud_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewUsersScreen extends StatefulWidget {
  const ViewUsersScreen({super.key});

  @override
  State<ViewUsersScreen> createState() => _ViewUsersScreenState();
}

class _ViewUsersScreenState extends State<ViewUsersScreen> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.getUsers();

  Future<void> _onTapDeleteBtn(String docId) async {
    var dialogRes =  await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to delete the user?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
    if(dialogRes == true){
      Response res = await FirebaseCrud.deleteUser(docId);
      if (res.code == 200) {
        Fluttertoast.showToast(
            msg: "User Deleted!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs
                  .map((e) => Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(e["name"]),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  print(e.id);
                                  _onTapDeleteBtn(e.id);
                                },
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                      ))
                  .toList(),
            );
          } else {
            return Text("NO DATA");
          }
        },
      ),
    );
  }
}
