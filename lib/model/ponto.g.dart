// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ponto.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Ponto on PontoBase, Store {
  final _$horaAtom = Atom(name: 'PontoBase.hora');

  @override
  double get hora {
    _$horaAtom.context.enforceReadPolicy(_$horaAtom);
    _$horaAtom.reportObserved();
    return super.hora;
  }

  @override
  set hora(double value) {
    _$horaAtom.context.conditionallyRunInAction(() {
      super.hora = value;
      _$horaAtom.reportChanged();
    }, _$horaAtom, name: '${_$horaAtom.name}_set');
  }

  final _$representacaoAtom = Atom(name: 'PontoBase.representacao');

  @override
  String get representacao {
    _$representacaoAtom.context.enforceReadPolicy(_$representacaoAtom);
    _$representacaoAtom.reportObserved();
    return super.representacao;
  }

  @override
  set representacao(String value) {
    _$representacaoAtom.context.conditionallyRunInAction(() {
      super.representacao = value;
      _$representacaoAtom.reportChanged();
    }, _$representacaoAtom, name: '${_$representacaoAtom.name}_set');
  }

  final _$horaConvertidaAtom = Atom(name: 'PontoBase.horaConvertida');

  @override
  double get horaConvertida {
    _$horaConvertidaAtom.context.enforceReadPolicy(_$horaConvertidaAtom);
    _$horaConvertidaAtom.reportObserved();
    return super.horaConvertida;
  }

  @override
  set horaConvertida(double value) {
    _$horaConvertidaAtom.context.conditionallyRunInAction(() {
      super.horaConvertida = value;
      _$horaConvertidaAtom.reportChanged();
    }, _$horaConvertidaAtom, name: '${_$horaConvertidaAtom.name}_set');
  }

  final _$minutosAtom = Atom(name: 'PontoBase.minutos');

  @override
  double get minutos {
    _$minutosAtom.context.enforceReadPolicy(_$minutosAtom);
    _$minutosAtom.reportObserved();
    return super.minutos;
  }

  @override
  set minutos(double value) {
    _$minutosAtom.context.conditionallyRunInAction(() {
      super.minutos = value;
      _$minutosAtom.reportChanged();
    }, _$minutosAtom, name: '${_$minutosAtom.name}_set');
  }

  final _$tipoPontoAtom = Atom(name: 'PontoBase.tipoPonto');

  @override
  String get tipoPonto {
    _$tipoPontoAtom.context.enforceReadPolicy(_$tipoPontoAtom);
    _$tipoPontoAtom.reportObserved();
    return super.tipoPonto;
  }

  @override
  set tipoPonto(String value) {
    _$tipoPontoAtom.context.conditionallyRunInAction(() {
      super.tipoPonto = value;
      _$tipoPontoAtom.reportChanged();
    }, _$tipoPontoAtom, name: '${_$tipoPontoAtom.name}_set');
  }

  final _$idAtom = Atom(name: 'PontoBase.id');

  @override
  String get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$totalMinutosAtom = Atom(name: 'PontoBase.totalMinutos');

  @override
  int get totalMinutos {
    _$totalMinutosAtom.context.enforceReadPolicy(_$totalMinutosAtom);
    _$totalMinutosAtom.reportObserved();
    return super.totalMinutos;
  }

  @override
  set totalMinutos(int value) {
    _$totalMinutosAtom.context.conditionallyRunInAction(() {
      super.totalMinutos = value;
      _$totalMinutosAtom.reportChanged();
    }, _$totalMinutosAtom, name: '${_$totalMinutosAtom.name}_set');
  }

  final _$PontoBaseActionController = ActionController(name: 'PontoBase');

  @override
  void setId(String id) {
    final _$actionInfo = _$PontoBaseActionController.startAction();
    try {
      return super.setId(id);
    } finally {
      _$PontoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinutos(double minutos) {
    final _$actionInfo = _$PontoBaseActionController.startAction();
    try {
      return super.setMinutos(minutos);
    } finally {
      _$PontoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHoraConvertida(double horaConvertida) {
    final _$actionInfo = _$PontoBaseActionController.startAction();
    try {
      return super.setHoraConvertida(horaConvertida);
    } finally {
      _$PontoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipoPonto(String tipoPonto) {
    final _$actionInfo = _$PontoBaseActionController.startAction();
    try {
      return super.setTipoPonto(tipoPonto);
    } finally {
      _$PontoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRepresentacao(String representacao) {
    final _$actionInfo = _$PontoBaseActionController.startAction();
    try {
      return super.setRepresentacao(representacao);
    } finally {
      _$PontoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHora(double hora) {
    final _$actionInfo = _$PontoBaseActionController.startAction();
    try {
      return super.setHora(hora);
    } finally {
      _$PontoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'hora: ${hora.toString()},representacao: ${representacao.toString()},horaConvertida: ${horaConvertida.toString()},minutos: ${minutos.toString()},tipoPonto: ${tipoPonto.toString()},id: ${id.toString()},totalMinutos: ${totalMinutos.toString()}';
    return '{$string}';
  }
}
