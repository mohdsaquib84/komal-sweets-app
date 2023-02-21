import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key,}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  var apiData;
  @override
  void initState() {
    super.initState();
    getData();
  }
  Future<void> getData() async {
    var api = await Dio().get('https://fair-jade-tick-tux.cyclic.app/api/menu');
    setState(() {
      apiData = api.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(apiData);
    return Scaffold(
      appBar: AppBar(
        title: Text('MenuPage'),
      ),
      body: Center(

        child: apiData==null ? Center(
          child: CircularProgressIndicator(),
        )
        :
        ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 250,
              width: double.infinity,
              color: Colors.pink.shade100,
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 200,
                    color: Colors.red,
                    child:Image.network('https://fair-jade-tick-tux.cyclic.app${apiData[index]['image']}',fit: BoxFit.fill),
                  ),
                  Expanded(
                    child: Container(
                      height:double.infinity ,
                      // width: 200,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${apiData[index]['name']}',style: TextStyle(fontSize: 25)),
                            Text('Rs.${apiData[index]['srp']}',style: TextStyle(fontSize: 15)),
                            Text('${apiData[index]['foodType']}'),
                            ElevatedButton(onPressed: ()=>{}, child:Text('Add To cart'))

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
          );
        },
          itemCount: apiData==null? 0 :apiData.length,
        )
      ),
    );
  }
}




//
// import 'package:flutter/material.dart';
//
// class MyListView extends StatelessWidget {
//   const MyListView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: ListView(
//             scrollDirection: Axis.vertical,
//             children: [
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//
//             ]
//         ),
//       ),
//     );
//   }
// }