import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _history();
}

class _history extends State<history> {
  var listData = [];

  void getDataApi() async {
    var url = Uri.parse("https://reqres.in/api/users?page=2");

    await http.get(url).then((value) {
      print(value.body);

      var jsonData = jsonDecode(value.body);

      setState(() {
        listData = jsonData['data'];
      });
      //list = decode['data'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDataApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daftar Pengujung"),
        ),
        body: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('${listData[index]['avatar']}'),
                  //child: Image.network('${listData}[index]['avatar']'),
                ),
                title: Text(
                  '${listData[index]['first_name']} ${listData[index]['last_name']}',
                ),
                subtitle: Text('${listData[index]['email']}'),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blueGrey,
        ));
  }
}
