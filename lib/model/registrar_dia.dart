import 'package:hive/hive.dart';
import 'ponto_hive.dart';

part 'registrar_dia.g.dart';

@HiveType(typeId: 0)
class RegistrarDia {

  @HiveField(0)
  String dataFormatada;

  @HiveField(1)
  int totalMinutos;

  @HiveField(2)
  int dia;

  @HiveField(3)
  int mes;

  @HiveField(4)
  int ano;

  @HiveField(5)
  String id;

  @HiveField(6)
  String descricao;

  @HiveField(7)
  List<MeuPontoBase> meusPontos = [];

  @HiveField(8)
  int dataMilliSeconds;

  RegistrarDia(this.dataFormatada, this.totalMinutos, this.dia, this.mes, this.ano, this.descricao, this.id, this.meusPontos, this.dataMilliSeconds);

}