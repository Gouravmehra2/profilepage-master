import 'package:flutter/material.dart';

class Navigation1 extends StatefulWidget {
  const Navigation1({super.key});
  @override
  State<Navigation1> createState() => _Navigation1State();
}

class _Navigation1State extends State<Navigation1> {
  Map? data;
  @override
  Widget build(BuildContext context) {
    data= ModalRoute.of(context)?.settings.arguments as Map?;
    return Scaffold(
        appBar: AppBar(
          title: Text('Sending data'),
          centerTitle: true,
        ),
        body:Center(
          child: data == null || data!.isEmpty ?
          TextField(decoration: InputDecoration(
            hintText: 'email'
          ),)
              :Column(
            children: [
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  label: Text('${data?['email']}'),
                ),

              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                    hintText: 'password',
                    label: Text('${data?['password']}')
                ),

              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                    hintText: 'name',
                    label: Text('${data?['name']}')
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('2'))
            ],
          )
          ,
        )

    );
  }
}
