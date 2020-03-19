import 'package:flutter/material.dart';

class CardInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CardInfoState();
  }
}

class CardInfoState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("data"),
            Text("data"),
          ],
        ),
      ),
      ),
    );
  }
}
