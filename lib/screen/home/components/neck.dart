import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pontopasso/screen/home/components/cardInfo.dart';
import 'package:pontopasso/store/controller.dart';
import 'package:provider/provider.dart';

class Naked extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NakedState();
  }
}

class NakedState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {

    Controller controller = Provider.of<Controller>(context);

    return Container(
      width: double.infinity,
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Observer(
              builder: (_) => CardInfo("Dia", (controller.totalDia).toString()),
            ),
          ],
        ),
      ),
    );
  }
}
