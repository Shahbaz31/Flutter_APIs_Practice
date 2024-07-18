import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';




class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}



class _SignUpScreenState extends State<SignUpScreen> {
  String url=  'https://jsonplaceholder.typicode.com/posts';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async {

    try{

      Response response = await post(
          Uri.parse(url),
          body: {
            'email' : email,
            'password' : password
          }
      );

      if(response.statusCode == 201){

        var data = jsonDecode(response.body.toString());
        // print(data['user']['token']);
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        print('Login successfully');

      }else {
        print('failed');
        print('Login failed: ${response.statusCode}');
        print('Response body: ${response.body}');


      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17d4ca),
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 60,
          backgroundColor: Color(0xff5F9EA0	),
          elevation: 100,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft:Radius.circular(30) )
          ),
          title: const Text('Sign in',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString());

              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Login'),),
              ),
            )
          ],
        ),
      ),
    );
  }
}