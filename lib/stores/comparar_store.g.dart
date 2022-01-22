// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompararStore on _CompararStore, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: '_CompararStore.isValid'))
      .value;

  final _$rendEtanolAtom = Atom(name: '_CompararStore.rendEtanol');

  @override
  String get rendEtanol {
    _$rendEtanolAtom.reportRead();
    return super.rendEtanol;
  }

  @override
  set rendEtanol(String value) {
    _$rendEtanolAtom.reportWrite(value, super.rendEtanol, () {
      super.rendEtanol = value;
    });
  }

  final _$rendGasolinaAtom = Atom(name: '_CompararStore.rendGasolina');

  @override
  String get rendGasolina {
    _$rendGasolinaAtom.reportRead();
    return super.rendGasolina;
  }

  @override
  set rendGasolina(String value) {
    _$rendGasolinaAtom.reportWrite(value, super.rendGasolina, () {
      super.rendGasolina = value;
    });
  }

  final _$precoEtanolAtom = Atom(name: '_CompararStore.precoEtanol');

  @override
  String get precoEtanol {
    _$precoEtanolAtom.reportRead();
    return super.precoEtanol;
  }

  @override
  set precoEtanol(String value) {
    _$precoEtanolAtom.reportWrite(value, super.precoEtanol, () {
      super.precoEtanol = value;
    });
  }

  final _$precoGasolinaAtom = Atom(name: '_CompararStore.precoGasolina');

  @override
  String get precoGasolina {
    _$precoGasolinaAtom.reportRead();
    return super.precoGasolina;
  }

  @override
  set precoGasolina(String value) {
    _$precoGasolinaAtom.reportWrite(value, super.precoGasolina, () {
      super.precoGasolina = value;
    });
  }

  final _$_CompararStoreActionController =
      ActionController(name: '_CompararStore');

  @override
  void setRendEtanol(String value) {
    final _$actionInfo = _$_CompararStoreActionController.startAction(
        name: '_CompararStore.setRendEtanol');
    try {
      return super.setRendEtanol(value);
    } finally {
      _$_CompararStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRendGasolina(String value) {
    final _$actionInfo = _$_CompararStoreActionController.startAction(
        name: '_CompararStore.setRendGasolina');
    try {
      return super.setRendGasolina(value);
    } finally {
      _$_CompararStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrecoEtanol(String value) {
    final _$actionInfo = _$_CompararStoreActionController.startAction(
        name: '_CompararStore.setPrecoEtanol');
    try {
      return super.setPrecoEtanol(value);
    } finally {
      _$_CompararStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrecoGasolina(String value) {
    final _$actionInfo = _$_CompararStoreActionController.startAction(
        name: '_CompararStore.setPrecoGasolina');
    try {
      return super.setPrecoGasolina(value);
    } finally {
      _$_CompararStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateEtanol() {
    final _$actionInfo = _$_CompararStoreActionController.startAction(
        name: '_CompararStore.validateEtanol');
    try {
      return super.validateEtanol();
    } finally {
      _$_CompararStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateGasolina() {
    final _$actionInfo = _$_CompararStoreActionController.startAction(
        name: '_CompararStore.validateGasolina');
    try {
      return super.validateGasolina();
    } finally {
      _$_CompararStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rendEtanol: ${rendEtanol},
rendGasolina: ${rendGasolina},
precoEtanol: ${precoEtanol},
precoGasolina: ${precoGasolina},
isValid: ${isValid}
    ''';
  }
}
