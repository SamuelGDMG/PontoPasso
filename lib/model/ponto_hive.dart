
import 'package:hive/hive.dart';

part 'ponto_hive.g.dart';

@HiveType(typeId: 1)
class MeuPontoBase {

  @HiveField(0)
  String tipoPonto;

  @HiveField(1)
  String id;

  @HiveField(2)
  int totalMinutos;

  MeuPontoBase(this.tipoPonto, this.id, this.totalMinutos);

}