import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pontopasso/model/ponto.dart';
import 'package:pontopasso/model/ponto_hive.dart';
import 'package:pontopasso/model/registrar_dia.dart';
import 'package:pontopasso/store/controller.dart';
import 'package:provider/provider.dart';

class SliderPonto extends StatefulWidget {
  final int index;
  final Ponto ponto;

  SliderPonto(this.index, this.ponto);

  @override
  _SliderPontoState createState() => _SliderPontoState();
}

class _SliderPontoState extends State<SliderPonto> {
  double valueHora = 0;
  double valueMinutos = 0;

  Ponto ponto;
  Controller controller;

  @override
  void initState() {
    super.initState();

    ponto = widget.ponto;

    valueHora = ponto.hora;
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<Controller>(context);
    return AlertDialog(
      title: Center(
        child: Text(
            "${valueHora < 10 ? "0${valueHora.toInt()}" : "${valueHora.toInt()}"}:${valueMinutos < 10 ? "0${valueMinutos.toInt()}" : "${valueMinutos.toInt()}"}"),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text("Hora: "),
            Container(
              child: Slider(
                min: 0,
                max: 23,
                value: valueHora,
                onChanged: (double newValue) {
                  setState(() {
                    valueHora = newValue;
                  });
                },
              ),
            ),
            Text("Minutos:"),
            Container(
              child: Slider(
                min: 0,
                max: 59,
                value: valueMinutos,
                onChanged: (double newValue) {
                  setState(() {
                    valueMinutos = newValue;
                  });
                },
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
            var representacao =
                "${valueHora < 10 ? "0${valueHora.toInt()}" : "${valueHora.toInt()}"}:${valueMinutos < 10 ? "0${valueMinutos.toInt()}" : "${valueMinutos.toInt()}"}";

            ponto.hora = valueHora;
            ponto.minutos = valueMinutos;
            ponto.representacao = representacao;
            ponto.totalMinutos = (valueHora.toInt() * 60) + valueMinutos.toInt();

            var box = await Hive.openBox("salvamentoTemporario");

            RegistrarDia re = box.get("temporario");

            List<MeuPontoBase> meusPontos = re.meusPontos;

              meusPontos.insert(widget.index, new MeuPontoBase(ponto.tipoPonto, ponto.id, ponto.totalMinutos));
              meusPontos.removeAt(widget.index + 1);


            re.meusPontos = meusPontos;

            box.put("temporario", re);

            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
