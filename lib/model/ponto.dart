import 'package:mobx/mobx.dart';

part 'ponto.g.dart';

class Ponto = PontoBase with _$Ponto;

abstract class PontoBase with Store {

  @observable
  double hora;

  @observable
  String representacao;

  @observable
  double horaConvertida;

  @observable
  double minutos;

  //Tipo ponto sempre tem quer ser nesse formato -> "Entrada" ou "Saída"
  @observable
  String tipoPonto;

  @observable
  String id;

  @observable
  int totalMinutos;



  PontoBase(this.tipoPonto, this.id, this.minutos, this.horaConvertida, this.representacao, this.hora, this.totalMinutos);

  @action
  void setId(String id){
    id = id;
  }

  @action
  void setMinutos(double minutos) {
    minutos = minutos;
  }

  @action
  void setHoraConvertida(double horaConvertida) {
    horaConvertida = horaConvertida;
  }


  @action
  void setTipoPonto(String tipoPonto) {
    tipoPonto = tipoPonto;
  }

  @action
  void setRepresentacao(String representacao) {
    representacao = representacao;
  }


  @action
  void setHora(double hora) {
    hora = hora;
  }

}
