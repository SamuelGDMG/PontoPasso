import 'package:flutter/material.dart';

class Body extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }

}

class BodyState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(25), topEnd: Radius.circular(25))
      ),
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            Text("data")
          ],
        ),
      ),
    );
  }

}