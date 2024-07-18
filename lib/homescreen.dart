

           //FETCHING DATA FROM API EXAMPLE 1

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apis/Models/postmodel.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  List<Postmodel> postlist=[] ;

  Future<List<Postmodel>> getpostapi()  async {
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      for(Map i in data){
        postlist.add(Postmodel.fromJson(i));
      }
      return postlist;
    }else{
      return postlist;
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('API Course'),
      ),
      body: Column(

        children: [
          Expanded(
            child: FutureBuilder(
                future: getpostapi(),
                builder: (context,snapshot){
                  if (!snapshot.hasData){
                    return Text('Loading');
                  }
                  else{
                    return ListView.builder(
                        itemCount: postlist.length,
                        itemBuilder: (context,index){
                          return Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('title'),
                                Text(postlist[index].title.toString()),
                                Text('body'),
                                Text(postlist[index].body.toString())
                              ],
                            ),
                          );
                        });
                  }
                }),
          )

        ],
      ),
    );
  }
}
