

                       // FETCHING API DATA USING COMPLEX MODEL



import 'dart:convert';

import 'package:apis/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class examplethree extends StatefulWidget {
  const examplethree({super.key});

  @override
  State<examplethree> createState() => _examplethreeState();
}

class _examplethreeState extends State<examplethree> {
  
  List<UserModel> userlist= [];
  
  Future<List<UserModel>>  getuserapi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    
    if(response.statusCode== 200){
      for(Map i in data){
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    }else{
      return userlist;
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getuserapi(),
                builder: (context,AsyncSnapshot<List<UserModel>> snapshot){
                  if(!snapshot.hasData){
                     return loadingbar();
                  }else{

                    return ListView.builder(
                        itemCount: userlist.length,
                        itemBuilder: (context,index){

                          return Card(

                            child: Column(
                              children: [
                                ReusableRow(name: 'Name', value: (snapshot.data![index].name.toString())),
                                ReusableRow(name: 'Email', value: (snapshot.data![index].email.toString())),
                                ReusableRow(name: 'Address', value: (snapshot.data![index].address!.street.toString())),
                                ReusableRow(name: 'Geo', value: (snapshot.data![index].address!.geo!.lng.toString())),
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

