import 'package:flutter/material.dart';
import 'package:pontopasso/model/registrar_dia.dart';
import 'package:pontopasso/store/controller.dart';
import 'package:provider/provider.dart';

class VisualizarAtRegistrada extends StatefulWidget {

  final int index;

  const VisualizarAtRegistrada(this.index);

  @override
  _VisualizarAtRegistradaState createState() => _VisualizarAtRegistradaState();
}

class _VisualizarAtRegistradaState extends State<VisualizarAtRegistrada> {



  @override
  Widget build(BuildContext context) {

    Controller controller = Provider.of<Controller>(context);
    RegistrarDia registrarDia = controller.meusPontosRegistrados[widget.index];

    return AlertDialog(
      title: Text("Data: ${registrarDia.dataFormatada}"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text("Total horas trabalhada: ${registrarDia.totalMinutos}"),
            Text("Descrição: ${registrarDia.descricao}"),
            Divider(),
            Text("Pontos registrados:"),
            Container(
              height: 180,
              width: double.maxFinite,
              child: ListView.builder(itemBuilder: (BuildContext context, i){
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Entrada: "),
                            Text("08:00")
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  );
                }, itemCount: 10,),

            )
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
