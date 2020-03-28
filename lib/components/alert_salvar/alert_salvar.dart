import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pontopasso/model/ponto.dart';
import 'package:pontopasso/model/ponto_hive.dart';
import 'package:pontopasso/model/registrar_dia.dart';
import 'package:pontopasso/store/controller.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AlertSalvar extends StatefulWidget {
  @override
  _AlertSalvarState createState() => _AlertSalvarState();
}

class _AlertSalvarState extends State<AlertSalvar> {
  TextEditingController descricao = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Controller controller = Provider.of<Controller>(context);

    return AlertDialog(
      title: Text("Salvar atividade"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              maxLength: 254,
              maxLengthEnforced: true,
              keyboardType: TextInputType.multiline,
              controller: descricao,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Descrição...",
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Salvar'),
          onPressed: () async {
            if (descricao.text.length < 10) {
              print("Digita mais ai ue");
            } else {
              var box = await Hive.openBox('meusRegistro');
              
              List<MeuPontoBase> meusPontosRegistrados = [];

              controller.meusPontos.forEach((item){
                meusPontosRegistrados.add(MeuPontoBase(item.tipoPonto, item.id, item.totalMinutos));
              });
              
              DateTime date = controller.dateTimeSelecionado;

              box.put(date.millisecondsSinceEpoch.toString(), RegistrarDia(controller.data, controller.totalHoras, date.day, date.month, date.year, descricao.text, Uuid().v1(), meusPontosRegistrados));

              print(box.length);

              await box.close();

            }
          },
        )
      ],
    );
  }
}