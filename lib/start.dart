import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minggu_4_2/home.dart';
import 'package:flutter_minggu_4_2/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class start extends StatefulWidget {
  @override
  _startState createState() => _startState();
}

class _startState extends State<start> {
  late SharedPreferences sharedPreferences;

  startSplashScreen() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      if (sharedPreferences.getString("email") != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => registrasi()),
        );
      }

      ///cek session
    });
  }

  @override
  void initState() {
    startSplashScreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png');
  }
}
