import 'package:flutter/material.dart';
import 'package:pontopasso/screen/home/components/cardInfo.dart';

class Naked extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NakedState();
  }
}

class NakedState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            CardInfo(),
            CardInfo(),
            CardInfo(),
            CardInfo(),
          ],
        ),
      ),
    );
  }
}
