import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:profilepage/ProfileDisableField/disable_input_field.dart';
import 'package:profilepage/button/button.dart';
import 'package:profilepage/navigation.dart';
import 'package:profilepage/navigation1.dart';
import 'package:profilepage/utils.dart';
void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home(),
      routes: {
        'input': (context) => Navigate(),
        'navigation1':(context)=>Navigation1()
      },
  ));
}
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Uint8List? _image;
  void selectImageCamera()async{
    Uint8List img = await pickImageFrom(ImageSource.camera);
    setState(() {
      _image = img;
    });
  }
  void selectImageGallery()async{
    Uint8List img = await pickImageFrom(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
        title: const Text('Profile Page',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        leading: const Icon(Icons.notifications,color: Colors.black),
        backgroundColor: Colors.deepOrangeAccent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings,color: Colors.black),
          )
        ],
      ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              // pickedFile!=null ? Image.file(pickedFile!) : Text('Please slect a text'),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        _image!=null ? CircleAvatar(
                          radius: 64,
                            backgroundImage: MemoryImage(_image!),
                        )
                            :
                            CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.blue,
                            )
                        ,Positioned(
                          bottom:0,
                            right: 0,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child:
                                _image !=null ? IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.orange,)):
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(context: context,
                                        builder: (builder) => bottomsheet());
                                  },
                                  icon: Icon(Icons.edit)),
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
              button(Textdata: 'Edit Profile',),
              DisableInputField(text: 'Name',value: 'Gourav',),
              const SizedBox(height: 10,),
              DisableInputField(text: 'Age',value: '23',),
              const SizedBox(height: 10,),
              DisableInputField(text: 'Gender',value: 'Male',),
              const SizedBox(height: 10,),
              DisableInputField(text: 'Phone',value: '7710567945',),
              const SizedBox(height: 10,),
              DisableInputField(text: 'Email',value: 'codergourav@gmail.com',),
              const SizedBox(height: 10,),
              DisableInputField(text: 'City',value: 'Ludhiana',),
              button(Textdata: 'Logout',),
              const Divider(thickness: 3,),
              Row(
                children: const [
                  Text('Connect With Us : -->',style: TextStyle(fontSize: 30),),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0,20, 0),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/instagram.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/facebook.png'),
                    ),
                  ),Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/gmail.png'),
                    ),
                  ),Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/twitter.png'),
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text('Choose profile photo', style: TextStyle(fontSize: 20.0),)
          , SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: () {
                selectImageGallery();
              }, icon: Icon(Icons.image), label: Text('gallery')),
              SizedBox(width: 50,),
              ElevatedButton.icon(onPressed: () {
                selectImageCamera();
              }, icon: Icon(Icons.camera), label: Text('camera'))
            ],
          )
        ],
      ),
    );
  }
}



















