import 'package:flutter/material.dart';
import 'package:pontopasso/screen/home/Components/header.dart';

import 'components/body.dart';
import 'components/neck.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("PontoPasso"),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Header(),
              ),
              Expanded(
                flex: 1,
                child: Naked(),
              ),
              Expanded(
                flex: 3,
                child: Body(),
              )
            ],
          ),
        ));
  }
}
