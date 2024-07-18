

               //CREATING OWN CUSTOM MODEL


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apis/Models/postmodel.dart';

class exampletwo extends StatefulWidget {
  const exampletwo({super.key});

  @override
  State<exampletwo> createState() => _exampletwoState();
}

class _exampletwoState extends State<exampletwo> {
  
  List<Photos> photolist=[];

  Future<List<Photos>> getphotos () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data =jsonDecode(response.body.toString());

    if(response.statusCode==200){
      for (Map i in data){
        Photos photos=Photos(title: i['title'], url: i['url'], id: i['id']);
        photolist.add(photos);
      }
      return photolist;
    }
    else{
      return photolist;
    }
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Course'),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getphotos(),
                builder: (context,AsyncSnapshot<List<Photos>> snapshot){
              return ListView.builder(
                  itemCount: photolist.length,
                  itemBuilder: (context,index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                  ),
                  subtitle: Text(snapshot.data![index].title.toString()),
                  title: Text('ID is '+snapshot.data![index].id.toString()),

                );
              });
            }),
          )
          

        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  int id;
  Photos({required this.title, required this.url, required this.id}) ;
}
