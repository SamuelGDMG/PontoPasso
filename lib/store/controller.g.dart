// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  Computed<String> _$totalDiaComputed;

  @override
  String get totalDia =>
      (_$totalDiaComputed ??= Computed<String>(() => super.totalDia)).value;

  final _$dataAtom = Atom(name: 'ControllerBase.data');

  @override
  String get data {
    _$dataAtom.context.enforceReadPolicy(_$dataAtom);
    _$dataAtom.reportObserved();
    return super.data;
  }

  @override
  set data(String value) {
    _$dataAtom.context.conditionallyRunInAction(() {
      super.data = value;
      _$dataAtom.reportChanged();
    }, _$dataAtom, name: '${_$dataAtom.name}_set');
  }

  final _$meusPontosAtom = Atom(name: 'ControllerBase.meusPontos');

  @override
  ObservableList<Ponto> get meusPontos {
    _$meusPontosAtom.context.enforceReadPolicy(_$meusPontosAtom);
    _$meusPontosAtom.reportObserved();
    return super.meusPontos;
  }

  @override
  set meusPontos(ObservableList<Ponto> value) {
    _$meusPontosAtom.context.conditionallyRunInAction(() {
      super.meusPontos = value;
      _$meusPontosAtom.reportChanged();
    }, _$meusPontosAtom, name: '${_$meusPontosAtom.name}_set');
  }

  final _$meusPontosRegistradosAtom =
      Atom(name: 'ControllerBase.meusPontosRegistrados');

  @override
  ObservableList<RegistrarDia> get meusPontosRegistrados {
    _$meusPontosRegistradosAtom.context
        .enforceReadPolicy(_$meusPontosRegistradosAtom);
    _$meusPontosRegistradosAtom.reportObserved();
    return super.meusPontosRegistrados;
  }

  @override
  set meusPontosRegistrados(ObservableList<RegistrarDia> value) {
    _$meusPontosRegistradosAtom.context.conditionallyRunInAction(() {
      super.meusPontosRegistrados = value;
      _$meusPontosRegistradosAtom.reportChanged();
    }, _$meusPontosRegistradosAtom,
        name: '${_$meusPontosRegistradosAtom.name}_set');
  }

  final _$dateTimeSelecionadoAtom =
      Atom(name: 'ControllerBase.dateTimeSelecionado');

  @override
  DateTime get dateTimeSelecionado {
    _$dateTimeSelecionadoAtom.context
        .enforceReadPolicy(_$dateTimeSelecionadoAtom);
    _$dateTimeSelecionadoAtom.reportObserved();
    return super.dateTimeSelecionado;
  }

  @override
  set dateTimeSelecionado(DateTime value) {
    _$dateTimeSelecionadoAtom.context.conditionallyRunInAction(() {
      super.dateTimeSelecionado = value;
      _$dateTimeSelecionadoAtom.reportChanged();
    }, _$dateTimeSelecionadoAtom,
        name: '${_$dateTimeSelecionadoAtom.name}_set');
  }

  final _$totalHorasAtom = Atom(name: 'ControllerBase.totalHoras');

  @override
  int get totalHoras {
    _$totalHorasAtom.context.enforceReadPolicy(_$totalHorasAtom);
    _$totalHorasAtom.reportObserved();
    return super.totalHoras;
  }

  @override
  set totalHoras(int value) {
    _$totalHorasAtom.context.conditionallyRunInAction(() {
      super.totalHoras = value;
      _$totalHorasAtom.reportChanged();
    }, _$totalHorasAtom, name: '${_$totalHorasAtom.name}_set');
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  void setData(DateTime date) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.setData(date);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateTime(DateTime date) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.setDateTime(date);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPonto(Ponto ponto) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.addPonto(ponto);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerPonto() {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.removerPonto();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void meuLog(ObservableList<RegistrarDia> meusLog) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.meuLog(meusLog);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelarPonto() {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.cancelarPonto();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'data: ${data.toString()},meusPontos: ${meusPontos.toString()},meusPontosRegistrados: ${meusPontosRegistrados.toString()},dateTimeSelecionado: ${dateTimeSelecionado.toString()},totalHoras: ${totalHoras.toString()},totalDia: ${totalDia.toString()}';
    return '{$string}';
  }
}
