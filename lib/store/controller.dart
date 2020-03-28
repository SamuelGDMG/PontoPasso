import 'package:mobx/mobx.dart';
import 'package:pontopasso/model/ponto.dart';

part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  String data = "";

  @observable
  ObservableList<Ponto> meusPontos = ObservableList<Ponto>();

  @observable
  DateTime dateTimeSelecionado;

  // Total em minutos
  @observable
  int totalHoras;

  @action
  void setData(DateTime date) {
    data =
        "${date.day < 10 ? "0${date.day}" : "${date.day}"}/${date.month < 10 ? "0${date.month}" : "${date.month}"}/${date.year}";
  }

  @action
  void setDateTime(DateTime date){
    dateTimeSelecionado = date;
  }

  @action
  void addPonto(Ponto ponto) {
    meusPontos.add(ponto);
  }

  @action
  void removerPonto() {
    meusPontos.removeLast();
  }

  @computed
  String get totalDia {
    double total = 0;
    int horas = 0;
    int minutos = 0;

    if (meusPontos.length > 1) {
      if (meusPontos.length % 2 == 0) {
        meusPontos.forEach((ponto) {
          if (ponto.tipoPonto == "Entrada") {
            total -= ponto.totalMinutos;
          } else {
            total += ponto.totalMinutos;
          }
        });
      } else {
        int index = 0;
        meusPontos.forEach((ponto) {
          if (index < meusPontos.length - 1) {
            if (ponto.tipoPonto == "Entrada") {
              total -= ponto.totalMinutos;
            } else {
              total += ponto.totalMinutos;
            }
          }
          index++;
        });
      }

      totalHoras = total.toInt();

      horas = total ~/ 60;

      minutos = (total % 60).toInt();
    }

    return "${horas < 10 ? "0$horas" : "$horas"}:${minutos < 10 ? "0$minutos" : "$minutos"}";
  }
}
