import 'package:flutter/material.dart';
import 'package:pontopasso/model/registrar_dia.dart';

class Historico extends StatefulWidget {
  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pontos"),
      ),
      body: FutureBuilder<RegistrarDia>(
        future: buscarHistorico(),
        builder: (BuildContext context, AsyncSnapshot snapshot){

          if(snapshot.data != null){
            return Text("lalal");
          }else{
            return Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando...")
                  ],
                ),
              ),
            );
          }

        },
      ),
    );
  }

  Future buscarHistorico(){



  }

}
