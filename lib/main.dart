import 'package:flutter/material.dart';
import 'package:komal_sweets/pages/AdminDashboard.dart';
import 'package:komal_sweets/pages/HomePage.dart';
import 'package:komal_sweets/pages/LogInCustomer.dart';
import 'package:komal_sweets/pages/MyListView.dart';
import 'package:komal_sweets/pages/RegisterPage.dart';
import 'package:komal_sweets/pages/SplashScreen.dart';


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
      initialRoute: '/splashscreen',
      routes:{
        '/':(context)=>HomePage(),
        '/menu':(context)=>MyListView(),
        '/admindashboard':(context)=>AdminDashboard(),
        '/splashscreen':(context) => SplashScreen(),
        '/logincustomer':(context) =>LogInCustomer(),
        '/registercustomer':(context) =>RegisterPage()
      },

    );
  }
}
