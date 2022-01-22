// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calcular_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalcularStore on _CalcularStore, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CalcularStore.isFormValid'))
          .value;

  final _$kmInicialAtom = Atom(name: '_CalcularStore.kmInicial');

  @override
  String get kmInicial {
    _$kmInicialAtom.reportRead();
    return super.kmInicial;
  }

  @override
  set kmInicial(String value) {
    _$kmInicialAtom.reportWrite(value, super.kmInicial, () {
      super.kmInicial = value;
    });
  }

  final _$kmFinalAtom = Atom(name: '_CalcularStore.kmFinal');

  @override
  String get kmFinal {
    _$kmFinalAtom.reportRead();
    return super.kmFinal;
  }

  @override
  set kmFinal(String value) {
    _$kmFinalAtom.reportWrite(value, super.kmFinal, () {
      super.kmFinal = value;
    });
  }

  final _$litrosAtom = Atom(name: '_CalcularStore.litros');

  @override
  String get litros {
    _$litrosAtom.reportRead();
    return super.litros;
  }

  @override
  set litros(String value) {
    _$litrosAtom.reportWrite(value, super.litros, () {
      super.litros = value;
    });
  }

  final _$_CalcularStoreActionController =
      ActionController(name: '_CalcularStore');

  @override
  void setKmInicial(String value) {
    final _$actionInfo = _$_CalcularStoreActionController.startAction(
        name: '_CalcularStore.setKmInicial');
    try {
      return super.setKmInicial(value);
    } finally {
      _$_CalcularStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKmFinal(String value) {
    final _$actionInfo = _$_CalcularStoreActionController.startAction(
        name: '_CalcularStore.setKmFinal');
    try {
      return super.setKmFinal(value);
    } finally {
      _$_CalcularStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLitros(String value) {
    final _$actionInfo = _$_CalcularStoreActionController.startAction(
        name: '_CalcularStore.setLitros');
    try {
      return super.setLitros(value);
    } finally {
      _$_CalcularStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateKmInicial() {
    final _$actionInfo = _$_CalcularStoreActionController.startAction(
        name: '_CalcularStore.validateKmInicial');
    try {
      return super.validateKmInicial();
    } finally {
      _$_CalcularStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateKmFinal() {
    final _$actionInfo = _$_CalcularStoreActionController.startAction(
        name: '_CalcularStore.validateKmFinal');
    try {
      return super.validateKmFinal();
    } finally {
      _$_CalcularStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateLitros() {
    final _$actionInfo = _$_CalcularStoreActionController.startAction(
        name: '_CalcularStore.validateLitros');
    try {
      return super.validateLitros();
    } finally {
      _$_CalcularStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kmInicial: ${kmInicial},
kmFinal: ${kmFinal},
litros: ${litros},
isFormValid: ${isFormValid}
    ''';
  }
}
