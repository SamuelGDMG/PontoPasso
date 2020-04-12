class FormatarData {

  static String formatarData(int totalMinutos){

    int horas = totalMinutos ~/ 60;

    int minutos = totalMinutos % 60;

    return "${horas < 10 ? "0$horas" : "$horas"}:${minutos < 10 ? "0$minutos" : "$minutos"}";
  }

}

