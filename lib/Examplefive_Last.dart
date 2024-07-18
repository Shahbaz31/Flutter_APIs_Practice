import 'dart:convert';

import 'package:apis/Models/ProductModel.dart';
import 'package:apis/Models/newproductmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class lastexample extends StatefulWidget {
  const lastexample({super.key});

  @override
  State<lastexample> createState() => _lastexampleState();
}

class _lastexampleState extends State<lastexample> {

  Future<Newproductmodel> getproductapi() async {
    final response = await http.get(Uri.parse('https://webhook.site/1d65ae65-ce77-400b-8cb8-861361e4be6b'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return Newproductmodel.fromJson(data);
    } else {
      return Newproductmodel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('API Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Newproductmodel>(
                future: getproductapi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(snapshot.data!.data![index].shop!.name.toString()),
                                  subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()) ,
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot.data!.data![index].images![index].url.toString()),
                                  ),
                                ),

                            Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height *
                                    .3,
                                width:
                                MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot
                                        .data!.data![index].images!.length,
                                    itemBuilder: (context, position) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Container(
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  .25,
                                          width:
                                              MediaQuery.of(context).size.width * .5,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(10),

                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(snapshot.data!.data![index].images![position].url.toString()))
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ]);
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      ),
    );
  }
}

