import 'package:flutter/material.dart';
class DisableInputField extends StatelessWidget {
  String? text;
  String? value;

  DisableInputField({this.text,this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                width:40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('${text}',style: TextStyle(color: Colors.white,fontSize: 25),)),
              )
          ),
          SizedBox(width: 25,),
          Expanded(
              flex: 5,
              child: Container(
                  width:40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('${value}',
                    style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),))
              )
          )
        ],
      ),
    );
  }
}