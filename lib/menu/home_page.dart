import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minggu_4_2/start.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
        child: _buildhomepage(),
      ),
    );
  }

  Widget _buildhomepage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Hallo ! $nama",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
