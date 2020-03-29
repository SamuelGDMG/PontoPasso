import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pontopasso/components/calendario/calendario.dart';
import 'package:pontopasso/components/slider_ponto/slider_ponto.dart';
import 'package:pontopasso/model/ponto.dart';
import 'package:pontopasso/store/controller.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<StatefulWidget> {
  Controller controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<Controller>(context);

    print(controller.meusPontos.length);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(25), topEnd: Radius.circular(25))),
      width: double.infinity,
      child: Container(
        child: Observer(
          builder: (_) {
            if (controller.data == "") {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[Calendario()],
                  ),
                ),
              );
            } else {
              if (controller.meusPontos.length == 0) {
                return Center(
                  child: Text(
                      "Pressione o push buttom \n para iniciar os registros"),
                );
              } else {
                return Column(
                  children: <Widget>[
                    Text("Registrando pontos"),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.meusPontos.length,
                        itemBuilder: (context, index) {
                          Ponto ponto = controller.meusPontos[index];
                          return conteudoCardPonto(ponto, index);
                        },
                      ),
                    )
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }

  Widget conteudoCardPonto(Ponto ponto, int index) {
    return GestureDetector(
      onLongPress: () async {
        await alertRemoverPonto(controller.meusPontos.length == (index + 1) ? true : false);
      },
      onTap: () async {
        await showDialog<double>(
          context: context,
          builder: (context) => SliderPonto(index, ponto),
        );
        //controller.updateHorario();
      },
      child: Observer(
        builder: (_) => Card(
        color:
            ponto.tipoPonto == "Entrada" ? Colors.green[300] : Colors.red[300],
        child: ListTile(
          title: Text(ponto.tipoPonto),
          subtitle: Text(ponto.representacao),
        ),
      ),
      ),
    );
  }

  Future<void> alertRemoverPonto(bool remover) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover Ponto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(remover
                    ? "Deseja remover esse ponto?" 
                    : "Você só pode remover o último ponto registrado")
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(remover ? "Cancelar " : "Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Visibility(
              visible: remover,
              child: FlatButton(
              child: Text("Remover"),
              onPressed: () {
                controller.removerPonto();
                Navigator.of(context).pop();
              },
            ),
            )
          ],
        );
      },
    );
  }
}
