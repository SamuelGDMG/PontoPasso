import 'package:flutter/material.dart';
import 'package:pontopasso/model/ponto.dart';
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
  double valueHora = 11;
  double valueMinutos = 11;

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
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
