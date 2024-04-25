import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget{
    const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>{

  @override
  void initState(){
    super.initState();
  }
  
  
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  late String _name, _userName, _email, _password, _confirmPassword, _address;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) => _name = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'User Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your user name';
                }
                return null;
              },
              onSaved: (value) => _userName = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) => _email = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) => _password = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                } else if (value != _password) {
                  return 'Passwords do not match';
                }
                return null;
              },
              onSaved: (value) => _confirmPassword = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              onSaved: (value) => _address = value!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Perform form submission logic here.
                  }
                },
                child: const Text('Update Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
