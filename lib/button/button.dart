import 'package:flutter/material.dart';
class button extends StatelessWidget {
  String? Textdata;
  button({this.Textdata});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: Text('${Textdata}'),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange,elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

    );
  }
}