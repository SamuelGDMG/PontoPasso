import 'package:flutter/material.dart';

class Header extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return HeaderState();
  }

}

class HeaderState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(25), bottomStart: Radius.circular(25))
      ),
      width: double.infinity,
      child: Center(
        child: Text("Foda-se"),
      ),
    );
  }

}