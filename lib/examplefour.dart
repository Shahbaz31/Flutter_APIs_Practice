

                            // FETCHING DATA FROM API WITHOUT ANY MODEL

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class examplefour extends StatefulWidget {
  const examplefour({super.key});

  @override
  State<examplefour> createState() => _examplefourState();
}

class _examplefourState extends State<examplefour> {
  var data;
  Future<void> getapi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));


    if(response.statusCode== 200){
       data =jsonDecode(response.body.toString());


    }else{

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Course'),
            ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getapi(),
                builder: (context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return loadingbar();
                  }else{
                    return ListView.builder(
                        itemCount: data.length,

                        itemBuilder: (context,index){
                      return Card(
                        child: Column(
                          children: [
                            ReusableRow(name: 'Name', value:(data[index]['name'].toString())),
                            ReusableRow(name: 'Email', value:(data[index]['email'].toString())),
                            ReusableRow(name: 'Address', value:(data[index]['address']['city'].toString())),
                            ReusableRow(name: 'Geo', value:(data[index]['address']['geo']['lng'].toString()))
                          ],
                        ),
                      );



                          ;
                    });
                  }

            }),
          )
        ],
      )
    );
  }
}



class ReusableRow extends StatelessWidget {

  String name, value;
  ReusableRow({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(name),
          Text(value)
        ],
      ),
    );
  }
}



class loadingbar extends StatelessWidget {
  const loadingbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Loading',style: TextStyle(fontSize: 30,color: Colors.green),

      ),
    ) ;
  }
}
