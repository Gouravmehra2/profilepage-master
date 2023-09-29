import 'package:flutter/material.dart';
import 'package:profilepage/input_field.dart';

class Navigate extends StatefulWidget {
  const Navigate({super.key});
  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  InputData data = InputData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        centerTitle: true,
      ),
      body:Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
              label: Text('Enter your Email Address'),
            ),
            onChanged: (value){
              data.email=value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'password',
                label: Text('Enter your password')
            ),
            onChanged: (value){
              data.password = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'name',
                label: Text('Enter your Name')
            ),
            onChanged: (value){
              data.name=value;
            },
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'navigation1',arguments: {
                  'email':data.email,
                  'password':data.password,
                  'name':data.name
                });
              },
              child: Text('Login'))
        ],
      )
    );
  }
}
