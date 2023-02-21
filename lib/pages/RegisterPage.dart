import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var mobileController = TextEditingController();
  var genderController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blueGrey.shade100,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text("Register Here",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
                SizedBox(height: 10,),
                Text("Register Your Credentials Here",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child: TextField(
                    controller: firstNameController,
                    autofocus: true,
                    decoration: InputDecoration(hintText: 'First Name',label: Text('First Name'),border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70))),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(hintText: 'Last Name',label: Text('Last Name'),border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70))),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'Email',label: Text('Email'),border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70))),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password',label: Text('Password'),border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70))),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child: TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Mobile',label: Text('Mobile'),border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70))),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child: TextField(
                    controller: genderController,
                    decoration: InputDecoration(hintText: 'Gender',label: Text('Gender'),border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white70))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () async {
                      // print('${firstNameController.text} ${lastNameController.text} ${emailController.text} ${passwordController.text} ${mobileController.text} ${genderController.text}');
                      var apiData = await Dio().post('https://fair-jade-tick-tux.cyclic.app/api/registeruser',options: Options(headers: {HttpHeaders.contentTypeHeader:"application/json"}),data: {
                        "firstName":firstNameController.text,
                        "lastName":lastNameController.text,
                        "email":emailController.text,
                        "mobile":mobileController.text,
                        "password":passwordController.text,
                        "gender":genderController.text
                      });
                      print(apiData.statusCode);
                      print(apiData.data);
                      if(apiData.statusCode==200){
                        Navigator.pushNamed(context, '/logincustomer');
                      }
                      else{
                        return;
                      }

                    }, child: Text('Register')),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Alreday Register? '),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/logincustomer'),
                          child: Text('Login'))
                    ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
