import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minggu_4_2/start.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profil extends StatefulWidget {
  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  String nama = "";
  String email = "";
  String password = "";
  late SharedPreferences sharedPreferences;
  List<dynamic> list_convert = [];
  String list_class = "";

  void initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      nama = sharedPreferences.getString("nama")!;
      password = sharedPreferences.getString("password")!;
      email = sharedPreferences.getString("email")!;
      list_class = sharedPreferences.getString("list_class")!;
      // list_class = json.decode.getString('list_class');
      print("hasil convert $list_convert");
    });
  }

  void logout() {
    sharedPreferences.remove("list_class");
    sharedPreferences.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => start()),
    );
  }

  @override
  void initState() {
    initShared();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        child: _buildprofil(),
      ),
    );
  }

  Widget _buildprofil() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          nama,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            logout();
          },
          child: Container(
            width: 100,
            child: Center(
              child: Text(
                "Logout",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        )
      ],
    );
  }
}
