import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './devapps.dart';

void main() {
  runApp(
    MaterialApp(home: TestApp()),
  );
}

class TestApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This app just for testing"),
        centerTitle: true,
      ),
      body: DevApps(),
    );
  }
}
