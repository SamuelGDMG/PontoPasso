import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pontopasso/components/alert_salvar/alert_salvar.dart';
import 'package:pontopasso/model/ponto.dart';
import 'package:pontopasso/model/registrar_dia.dart';
import 'package:pontopasso/screen/home/Components/header.dart';

import 'package:path_provider/path_provider.dart' as path_provide;

import 'package:hive/hive.dart';
import 'package:pontopasso/store/controller.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'components/body.dart';
import 'components/neck.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller controller;

  @override
  Widget build(BuildContext context) {
    controller = controller = Provider.of<Controller>(context);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          Observer(
            builder: (_) => cancelar(),
          ),
          Observer(
            builder: (_) => salvar(),
          )
        ],
        title: Text("PontoPasso"),
      ),
      body: FutureBuilder(
        future: openBox(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container(
                child: Center(
                  child: Text("Erro!"),
                ),
              );
              break;
            case ConnectionState.waiting:
              return Container(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando...")
                  ],
                )),
              );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              return Container(
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
              );
              break;
          }
        },
      ),
      floatingActionButton: fab(),
    );
  }

  Widget fab() {
    return Observer(
      builder: (_) => Visibility(
        visible: controller.data != "" ? true : false,
        child: FloatingActionButton(
          onPressed: () {
            if (controller.meusPontos.length > 0) {
              String tipo = controller
                          .meusPontos[controller.meusPontos.length - 1]
                          .tipoPonto ==
                      "Entrada"
                  ? "Saída"
                  : "Entrada";

              controller
                  .addPonto(new Ponto(tipo, Uuid().v1(), 0, 0, "00:00", 0, 0));
            } else {
              controller.addPonto(
                  new Ponto("Entrada", Uuid().v1(), 0, 0, "00:00", 0, 0));
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget salvar() {
    if (controller.data == "") {
      return Container();
    } else {
      return IconButton(
        icon: Icon(Icons.done),
        onPressed: () {
          if (controller.meusPontos.length < 2) {
            print("Vc precisa registrar ao menos dois pontos");
          } else {
            showDialog<double>(
              context: context,
              builder: (context) => AlertSalvar(),
            );
          }
        },
      );
    }
  }

  Widget cancelar() {
    if (controller.data == "") {
      return Container();
    } else {
      return IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () async {
          var box = await Hive.openBox('meusRegistro');
          RegistrarDia res = box.getAt(0);
          print(box.values);
          print(box.length);
          print(res.dataFormatada);
        },
      );
    }
  }

  Future openBox() async {
    final document = await path_provide.getApplicationDocumentsDirectory();

    Hive.init(document.path);
  }
}
