import 'package:flutter/material.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appBarTitle = "View User";
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
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
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
              ),
              TextFormField(
                controller: _emailController,
              ),
              TextFormField(
                controller: _ageController,
              ),
              TextFormField(
                controller: _phoneController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
