import 'package:firebase_app/services/crud_service.dart';
import 'package:flutter/material.dart';

class UpdateUserScreen extends StatefulWidget {
  String docId;

  UpdateUserScreen(this.docId, {super.key});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  late String _appBarTitle;
  late GlobalKey<FormState> _formKey;

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _ageController;
  late TextEditingController _phoneController;

  late bool _editModeOn;

  late String _bottomBtnText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appBarTitle = "View User";
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _ageController = TextEditingController();
    _phoneController = TextEditingController();

    _editModeOn = false;

    _bottomBtnText = "Edit";

    getData();
  }

  Future<void> getData() async {
    var data = await FirebaseCrud.getUser(widget.docId);
    _nameController.text = data["name"];
    _emailController.text = data["email"];
    _ageController.text = data["age"].toString();
    _phoneController.text = data["phone"];
  }

  void _onTapBottomBtn(){
    if(!_editModeOn){
      setState(() {
        _editModeOn = true;
        _bottomBtnText = "Update";
      });
    }else{

      setState(() {
        _editModeOn = false;
        _bottomBtnText = "Edit";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  enabled: _editModeOn,
                  decoration: const InputDecoration(
                    hintText: "Name",
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  enabled: _editModeOn,
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
                TextFormField(
                  controller: _ageController,
                  enabled: _editModeOn,
                  decoration: const InputDecoration(
                    hintText: "Age",
                  ),
                ),
                TextFormField(
                  controller: _phoneController,
                  enabled: _editModeOn,
                  decoration: const InputDecoration(
                    hintText: "Phone",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(onPressed: (){
                    _onTapBottomBtn();
                  }, child: Text(_bottomBtnText)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
