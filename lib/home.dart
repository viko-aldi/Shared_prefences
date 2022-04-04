import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minggu_4_2/menu/film.dart';
import 'package:flutter_minggu_4_2/menu/history.dart';
import 'package:flutter_minggu_4_2/menu/home_page.dart';
import 'package:flutter_minggu_4_2/menu/profile.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentIndex = 0;

  void selectedIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List ListPage = [
    homepage(),
    HomeScreen(),
    history(),
    profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListPage[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.green),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Film', icon: Icon(Icons.movie_creation)),
          BottomNavigationBarItem(label: 'History', icon: Icon(Icons.history)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
