import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:komal_sweets/pages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInCustomer extends StatefulWidget {
   LogInCustomer ({Key? key}) : super(key: key);

  @override
  State<LogInCustomer> createState() => _LogInCustomerState();
}

class _LogInCustomerState extends State<LogInCustomer> {
  var mobileController = TextEditingController();

  var passwordController = TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  Future<void> getData() async {
   var data = await SharedPreferences.getInstance();
   print(data.getBool('isLogin'));
   print(data.getString('userName'));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.pink.shade200,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text('Log In',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
              SizedBox(height: 10,),
              Text('Passed Your Credentials Here ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                    controller: mobileController ,
                    decoration: InputDecoration(hintText: 'Mobile Number',labelText: 'Mobile Number',border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black))),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,

                  decoration: InputDecoration(hintText: 'Password',labelText: 'Password',border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black))),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: double.infinity,
                    child: ElevatedButton(onPressed: () async {
                      // print(mobileController.text);
                      // print(passwordController.text );
                      var res = await Dio().post('https://fair-jade-tick-tux.cyclic.app/api/verifyuser',options: Options(headers: {HttpHeaders.contentTypeHeader:"application/json"}),data: {
                        "mobile":mobileController.text,
                        "password":passwordController.text
                      });
                      print(res.statusCode);
                      print(res.data['response']['firstName']);
                      if(res.statusCode==200){
                      var preInst = await SharedPreferences.getInstance();
                      await preInst.setBool('isLogin', true);
                      preInst.setString('userName',res.data['response']['firstName'] );
                      setState(() {

                      });
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      }
                      else{
                        return;
                      }
                    }, child: Text('Log In',style: TextStyle(fontSize: 20),))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont Have Account? '),
                  InkWell(
                      onTap: () => Navigator.pushNamed(context, '/registercustomer'),
                      child: Text('Register'))
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}
