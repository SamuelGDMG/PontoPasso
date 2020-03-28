import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pontopasso/store/controller.dart';
import 'package:provider/provider.dart';


class Header extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return HeaderState();
  }

}

class HeaderState extends State<StatefulWidget>{

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<Controller>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(25), bottomStart: Radius.circular(25))
      ),
      width: double.infinity,
      child: Center(
        child: Observer(
          builder: (_) {
            if(controller.data == ""){
              return Text("Você não iniciou uma atividade!");
            }else{
              return Text(controller.data);
            }
          },
        ),
      ),
    );
  }

}