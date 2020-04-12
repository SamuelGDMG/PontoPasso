import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pontopasso/helper/formatar_data.dart';
import 'package:pontopasso/model/ponto_hive.dart';
import 'package:pontopasso/model/registrar_dia.dart';

class Historico extends StatefulWidget {
  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {

  var objExpand = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pontos"),
      ),
      body: FutureBuilder<List<RegistrarDia>>(
        future: buscarHistorico(),
        builder: (BuildContext context, AsyncSnapshot snapshot){

          print("aqui");
          print(snapshot.data);

          if(snapshot.data != null){
            if(snapshot.data.length > 0){
              return listarHistorico(snapshot.data);
            }else{
              return Container(
                child: Center(
                  child: Text("Nenhum registro"),
                ),
              );
            }
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

  Future<List<RegistrarDia>> buscarHistorico() async {

    List<RegistrarDia> meusRegistros = List();

    var box = await Hive.openBox('meusRegistro');

    if(box.length > 0){
      for(var i = 0; i < box.length; i++){
        meusRegistros.add(box.getAt(i));
      }
    }

    return meusRegistros;

  }

  Widget listarHistorico(List<RegistrarDia> registros){

    return Container(
      child: ListView.builder(
          itemCount: registros.length,
          itemBuilder: (BuildContext context, int index){

            RegistrarDia registrarDia = registros[index];

            return ExpansionPanelList(
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          width: double.infinity,
                          child: Text("Total hora: ${FormatarData.formatarData(registrarDia.totalMinutos)}"),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: double.infinity,
                          child: Text("Descrição: ${registrarDia.descricao}"),
                        ),
                        Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: registrarDia.meusPontos.length,
                          itemBuilder: (BuildContext context, int index){

                            MeuPontoBase meuPontoBase = registrarDia.meusPontos[index];

                            return Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(meuPontoBase.tipoPonto),
                                  Text(FormatarData.formatarData(meuPontoBase.totalMinutos))
                                ],
                              ),
                            );
                          },)
                      ],
                    ),
                  ),
                    headerBuilder: (BuildContext context, bool isExpanded){
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          registrarDia.dataFormatada,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    isExpanded : objExpand == index ? true : false
                )
              ],
              expansionCallback: (int item, bool status) {

                if(objExpand == index){
                  setState(() {
                    objExpand = -1;
                  });
                }else{
                  setState(() {
                    objExpand = index;
                  });
                }

              },
            );
      }),
    );
  }

}
