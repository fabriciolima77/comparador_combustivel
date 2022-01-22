import 'package:mobx/mobx.dart';

part 'comparar_store.g.dart';

class CompararStore = _CompararStore with _$CompararStore;

abstract class _CompararStore with Store {

  @observable
  String rendEtanol = "";

  @observable
  String rendGasolina = "";

  @observable
  String precoEtanol = "";

  @observable
  String precoGasolina = "";

  @action
  void setRendEtanol(String value) => rendEtanol = value;

  @action
  void setRendGasolina(String value) => rendGasolina = value;

  @action
  void setPrecoEtanol(String value) => precoEtanol = value;

  @action
  void setPrecoGasolina(String value) => precoGasolina = value;

  @action
  validateEtanol(){
    if(precoEtanol.isEmpty){
      return "Campo obrigatório!";
    } return null;
  }

  @action
  validateGasolina(){
    if(precoGasolina.isEmpty){
      return "Campo obrigatório!";
    } return null;
  }

  @computed
  bool get isValid => precoEtanol.isNotEmpty && precoGasolina.isNotEmpty;

}