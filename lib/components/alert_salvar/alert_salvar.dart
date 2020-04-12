import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pontopasso/model/ponto.dart';
import 'package:pontopasso/model/ponto_hive.dart';
import 'package:pontopasso/model/registrar_dia.dart';
import 'package:pontopasso/store/controller.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

class AlertSalvar extends StatefulWidget {
  @override
  _AlertSalvarState createState() => _AlertSalvarState();
}

class _AlertSalvarState extends State<AlertSalvar> {
  TextEditingController descricao = TextEditingController();

  bool alternarCores = false;

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
              onChanged: (texto){
                if(texto.length >= 24){
                  setState(() {
                    alternarCores = true;
                  });
                }else{
                  setState(() {
                    alternarCores = false;
                  });
                }
              },
              maxLength: 254,
              maxLengthEnforced: true,
              keyboardType: TextInputType.multiline,
              controller: descricao,
              maxLines: 6,

              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: alternarCores ? Colors.blue : Colors.red
                    )
                ),
                hintText: "Descrição...",
                border: OutlineInputBorder(
                ),
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
            if (descricao.text.length < 24) {
              print("Digita mais ai ue");
            } else {
              var box = await Hive.openBox('meusRegistro');
              
              List<MeuPontoBase> meusPontosRegistrados = [];

              controller.meusPontos.forEach((item){
                meusPontosRegistrados.add(MeuPontoBase(item.tipoPonto, item.id, item.totalMinutos));
              });
              
              DateTime date = controller.dateTimeSelecionado;

              RegistrarDia registrarDia =  RegistrarDia(controller.data, controller.totalHoras, date.day, date.month, date.year, descricao.text, Uuid().v1(), meusPontosRegistrados, date.millisecondsSinceEpoch);

              box.put(date.millisecondsSinceEpoch.toString(), registrarDia);

              print(box.length);

              controller.registrandoUmLog(registrarDia);

              var boxTemp = await Hive.openBox("salvamentoTemporario");
              await boxTemp.clear();

              controller.cancelarPonto();

              Toast.show("Salvando...", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

              Navigator.of(context).pop();

              //await box.close();

            }
          },
        )
      ],
    );
  }
}