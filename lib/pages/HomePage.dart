import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:komal_sweets/pages/MyListView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  var apiData;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchapi();
  }
  fetchapi() async {
    var serverData = await Dio().get("https://fair-jade-tick-tux.cyclic.app/api/restaurant");
    setState(() {
      apiData = serverData.data;
    });

  }
  
  @override
  Widget build(BuildContext context) {
    // print(apiData);
    return Scaffold(
      appBar: AppBar(
        title: Text("Komal S Sweets"),
      ),
      body:Container(
        // height: 300,
        width: double.infinity,
        // color: Colors.red,
        child: apiData==null? Center(
          child: CircularProgressIndicator(),
        )
        :
        ListView.builder(itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context) => MyListView(),))},
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.green,

                  child: Image.network('https://fair-jade-tick-tux.cyclic.app${apiData[index]['image']}',fit: BoxFit.fill,),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(apiData[index]['name'],style: TextStyle(fontSize: 20)),
                            Text(apiData[index]['pan'],style: TextStyle(fontSize: 15 ))
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(apiData[index]['restaurantType'],style: TextStyle(fontSize: 15)),
                            Text('${apiData[index]['mobile']}',style: TextStyle(fontSize: 12))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(apiData[index]['offerText'],style: TextStyle(fontSize: 20))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),itemCount: apiData==null?0:apiData.length,),
      ),

    );
  }
}


