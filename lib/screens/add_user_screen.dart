import 'package:firebase_app/models/response.dart';
import 'package:firebase_app/services/crud_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUserScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late int _age;
  late String _phone;

  AddUserScreen({super.key});

  String? _validateRequired(String text){
    if(text == ''){
      return "Field is required!";
    }
    return null;
  }

  Future<void> _onTapSaveBtn(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      _formKey.currentState?.save();
      Response res = await FirebaseCrud.addUser(_name, _email, _age, _phone);
      if(res.code == 200){
        Fluttertoast.showToast(
            msg: "User Added!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.of(context).pop(AddUserScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: "Name"),
                    onSaved: (text) {
                      _name = text!;
                    },
                    validator: (text){
                      return _validateRequired(text!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Email"),
                    onSaved: (text){
                      _email = text!;
                    },
                    validator: (text){
                      return _validateRequired(text!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Age"),
                    onSaved: (text){
                      _age = int.parse(text!);
                    },
                    validator: (text){
                      return _validateRequired(text!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Phone"),
                    onSaved: (text){
                      _phone = text!;
                    },
                    validator: (text){
                      return _validateRequired(text!);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _onTapSaveBtn(context);
                      },
                      child: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
