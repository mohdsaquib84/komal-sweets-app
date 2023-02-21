import 'dart:async';

import 'package:flutter/material.dart';
import 'package:komal_sweets/pages/HomePage.dart';
import 'package:komal_sweets/pages/LogInCustomer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    openNextPage();
  }
  void openNextPage(){
    Timer.periodic(Duration(seconds: 3), (timer) async {
      var preInst = await SharedPreferences.getInstance();
      var userLogin = await preInst.getBool('isLogin');
      if(userLogin == null || userLogin == false || userLogin == "undefined"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInCustomer(),));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }

    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Center(
          child: Text('Komal Sweets',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.yellow)),
        ),
      )
    );
  }
}
