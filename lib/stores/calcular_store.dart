import 'package:mobx/mobx.dart';

part 'calcular_store.g.dart';

class CalcularStore = _CalcularStore with _$CalcularStore;

abstract class _CalcularStore with Store {

  @observable
  late String kmInicial = "";

  @action
  void setKmInicial(String value) => kmInicial = value;

  @observable
  late String kmFinal = "";

  @action
  void setKmFinal(String value) => kmFinal = value;

  @observable
  late String litros = "";

  @action
  void setLitros(String value) => litros = value;

  @action
   validateKmInicial(){
    if(kmInicial.isEmpty){
      return "Campo obrigatório!";
    } return null;
  }

  @action
    validateKmFinal(){
    if(kmFinal.isEmpty){
      return "Campo obrigatório!";
    }
    else if(double.parse(kmFinal) < double.parse(kmInicial)){
      return "Hodômetro final não pode ser menor que inicial!";
    } return null;
  }

  @action
   validateLitros(){
    if(litros.isEmpty){
      return "Campo obrigatório!";
    } return null;
  }

  @computed
  bool get isFormValid => kmInicial.isNotEmpty && kmFinal.isNotEmpty && litros.isNotEmpty && double.parse(kmFinal) > double.parse(kmInicial);

}

//Todo retirar as actions validate e trocar por computed bool get isKmFinalValid de acordo
//todo com a login_store da todo_mobx no github