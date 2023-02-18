import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Komal Sweets"),
      ),
      body:Container(
        // height: 300,
        width: double.infinity,
        color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.green,
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
                              Text("AD Bros",style: TextStyle(fontSize: 20)),
                              Text("Veg",style: TextStyle(fontSize: 15 ))
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Rating 3.5',style: TextStyle(fontSize: 15)),
                              Text('Mobile',style: TextStyle(fontSize: 12))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("20% Off On this Vendor",style: TextStyle(fontSize: 20))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.green,
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
                              Text("AD Bros",style: TextStyle(fontSize: 20)),
                              Text("Veg",style: TextStyle(fontSize: 15 ))
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Rating 3.5',style: TextStyle(fontSize: 15)),
                              Text('Mobile',style: TextStyle(fontSize: 12))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("20% Off On this Vendor",style: TextStyle(fontSize: 20))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.green,
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
                              Text("AD Bros",style: TextStyle(fontSize: 20)),
                              Text("Veg",style: TextStyle(fontSize: 15 ))
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Rating 3.5',style: TextStyle(fontSize: 15)),
                              Text('Mobile',style: TextStyle(fontSize: 12))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("20% Off On this Vendor",style: TextStyle(fontSize: 20))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
