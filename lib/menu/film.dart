import 'package:flutter/material.dart';

class film extends StatefulWidget {
  const film({Key? key}) : super(key: key);

  @override
  State<film> createState() => _filmState();
}

class _filmState extends State<film> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('film'),
    );
  }
}
