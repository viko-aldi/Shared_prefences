import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minggu_4_2/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registrasi extends StatefulWidget {
  const registrasi({Key? key}) : super(key: key);

  @override
  State<registrasi> createState() => _registrasiState();
}

class _registrasiState extends State<registrasi> {
  String nama = "";
  String email = "";
  String password = "";
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  void saveToPref() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      List<Map<String, dynamic>> list_person = [];

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("nama", nama);
      sharedPreferences.setString("email", email);
      sharedPreferences.setString("password", password);
      sharedPreferences.setString("list_class", jsonEncode(list_person));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.all(5),
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          _buildFormLogin()
        ],
      ),
    ));
  }

  Widget _buildFormLogin() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "THE FILM",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Nama',
                  hintStyle: TextStyle(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Nama wajib diisi";
                }
                return null;
              },
              onSaved: (String? value) {
                nama = value!;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email wajib diisi";
                }
                return null;
              },
              onSaved: (String? value) {
                email = value!;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  )),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "password wajib diisi";
                }
                return null;
              },
              onSaved: (String? value) {
                password = value!;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  onPressed: () async {
                    saveToPref();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Text("Masuk",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
