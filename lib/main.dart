import 'package:flutter/material.dart';
import 'package:komal_sweets/pages/HomePage.dart';
import 'package:komal_sweets/pages/MyListView.dart';

void main(){
  runApp(appSetting());
}

class appSetting extends StatelessWidget {
  const appSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: HomePage(),

    );
  }
}
