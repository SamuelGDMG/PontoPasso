import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pontopasso/store/controller.dart';
import 'package:provider/provider.dart';

class CardInfo extends StatefulWidget {

  final String texto;
  final String totalDia;

  CardInfo(this.texto, this.totalDia);

  @override
  _CardInfoState createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
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
            Text(widget.texto),
            Observer(
              builder: (_) => Text(widget.totalDia),
            )
          ],
        ),
      ),
      ),
    );
  }
}
