import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pontopasso/components/alert_salvar/alert_salvar.dart';
import 'package:pontopasso/components/visualizar_atividade_registrada/visualizar_at_registrada.dart';
import 'package:pontopasso/model/ponto.dart';
import 'package:pontopasso/model/ponto_hive.dart';
import 'package:pontopasso/model/registrar_dia.dart';
import 'package:pontopasso/screen/historico/historico.dart';
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
    controller = Provider.of<Controller>(context);
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Historico()),
                  );
                },
                child: ListTile(
                  title: Text("Pontos registrados"),
                ),
              )
            ],
          ),
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
              return Container(
                child: Text(("awdawd")),
              );
              break;
            case ConnectionState.done:
              return Container(
                color: Colors.grey,
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

          return Container(
            child: Text("Erro!"),
          );

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
          onPressed: () async {

            var box = await Hive.openBox("salvamentoTemporario");

            RegistrarDia re = box.get("temporario");

            List<MeuPontoBase> meusPontos = re.meusPontos;

            Ponto ponto;

            if (controller.meusPontos.length > 0) {
              String tipo = controller
                          .meusPontos[controller.meusPontos.length - 1]
                          .tipoPonto ==
                      "Entrada"
                  ? "Saída"
                  : "Entrada";

              ponto = new Ponto(tipo, Uuid().v1(), 0, 0, "00:00", 0, 0);

              controller
                  .addPonto(ponto);
            } else {
              ponto = new Ponto("Entrada", Uuid().v1(), 0, 0, "00:00", 0, 0);
              controller.addPonto(ponto);
            }

            meusPontos.add(new MeuPontoBase(ponto.tipoPonto, ponto.id, ponto.totalMinutos));

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
        onPressed: () async {
          if (controller.meusPontos.length < 2) {
            await alertDialog();
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
          await _neverSatisfied();
        },
      );
    }
  }

  Future openBox() async {

    final document = await path_provide.getApplicationDocumentsDirectory();

    Hive.init(document.path);

    var box = await Hive.openBox("salvamentoTemporario");

    if(box.isNotEmpty){
      print("N esta vazio");
      RegistrarDia registrarDia = box.get("temporario");

      controller.setDataFormatada(registrarDia.dataFormatada);

      List<MeuPontoBase> listMeuPontoBase = registrarDia.meusPontos;

      ObservableList<Ponto> obsPonto = ObservableList<Ponto>();

      listMeuPontoBase.forEach((item){
        double minutos = (item.totalMinutos % 60).toDouble();
        double hora = (item.totalMinutos / 60).toDouble();
        String representacao = "${hora < 10 ? "0${hora.toInt()}" : "${hora.toInt()}"}:${minutos < 10 ? "0${minutos.toInt()}" : "${minutos.toInt()}"}";
        obsPonto.add(new Ponto(item.tipoPonto, item.id, minutos, 0, representacao, hora, item.totalMinutos));
      });

      controller.setMeusPontos(obsPonto);

      controller.setDateTime(DateTime.fromMillisecondsSinceEpoch(registrarDia.dataMilliSeconds));

    }

  }

  Future log() async {

    final document = await path_provide.getApplicationDocumentsDirectory();

    Hive.init(document.path);

    ObservableList<RegistrarDia> meusLog = ObservableList<RegistrarDia>();

    var box = await Hive.openBox('meusRegistro');

    for(var i = 0; i < box.length; i++){
      meusLog.add(box.getAt(i));
    }

    controller.meuLog(meusLog);
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancelar atividade'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Deseja cancelar o registro da sua atividade?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Sim'),
              onPressed: () async {
                var box = await Hive.openBox("salvamentoTemporario");
                 await box.clear();
                 controller.cancelarPonto();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> alertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Salvar atividade'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Você precisa registrar 2 pontos para salvar uma atividade!'),
                Divider(),
                Text('OBS! Enquanto você não cancelar/salvar uma atividade, ela permanecera registrada na sua home.')
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
