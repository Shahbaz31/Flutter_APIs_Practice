import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File ? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  
  
  Future getimage() async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    
    if(pickedFile!= null){
      image=File(pickedFile.path);
      setState(() {
        
      });
    }else{
      print('not uploaded');
    }
    
  }
  
  Future<void> UploadImage()async {
    setState(() {
      showSpinner=true;
    });
    var stream = http.ByteStream(image!.openRead());
    var length = await image!.length();
    
    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = new http.MultipartRequest('Post', uri);
    request.fields['title'] = "Static Title";
    var multiport = new http.MultipartFile('image', stream, length);

    request.files.add(multiport);

    var response = await request.send();

    if(response.statusCode==200){
      setState(() {
        showSpinner=false;
      });
      print('Image Uploaded');
    }else{
      print('Image not Uploaded');
      setState(() {
        showSpinner=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(

        appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 60,
            backgroundColor: Color(0xff5F9EA0	),
            elevation: 100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft:Radius.circular(30) )
            ),
            title: const Text('Upload Image',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                getimage();
              },
              child: Container(
                child: image == null? Center(child: Text('Pick Image'),) :
                Container(child: Center(child: Image.file(
                  File(image!.path).absolute,
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  fit: BoxFit.cover,
                ),),),

              ),
            ),SizedBox(height: 150,),
            GestureDetector(
              onTap: (){
                UploadImage();
              },
              child: Container(
                height: 100,
                width: 200,
                color: Colors.green,
                child: Center(child: Text('Upload Image')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
