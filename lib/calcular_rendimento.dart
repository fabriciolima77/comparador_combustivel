import 'package:comparador_combustivel/stores/calcular_store.dart';
import 'package:comparador_combustivel/widgets/criabotao.dart';
import 'package:comparador_combustivel/widgets/criacampotextovalidate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: use_key_in_widget_constructors
class CalcularRendimento extends StatefulWidget {
  @override
  _CalcularRendimentoState createState() => _CalcularRendimentoState();
}

class _CalcularRendimentoState extends State<CalcularRendimento> {

  CalcularStore calcularStore = CalcularStore();

  var resultado ="";
  bool _isVisible = false;

  void calculaMedia(){
    var hodometroInicial = double.parse(calcularStore.kmInicial);
    var hodometroFinal = double.parse(calcularStore.kmFinal);
    var qtdLitros = double.parse(calcularStore.litros.replaceAll(",", "."));
    final kmRodado = hodometroFinal - hodometroInicial;
    final mediaComb = kmRodado / qtdLitros;

      setState(() {
        resultado = "A média de consumo do seu veículo é: "
            "${mediaComb.toStringAsPrecision(3)} Km/L";
        _isVisible = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcular rendimento",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(35, 10, 10, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Dados do veículo: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: alturaTela < 600 ? alturaTela * 0.55: alturaTela * 0.5,
                width: larguraTela * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.blue[50]
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Hodômetro inicial: ",
                        style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Observer(builder: (_) {
                      return CampoTextoValidate(
                          /*controller: kmInicialControl,*/
                          onChanged: calcularStore.setKmInicial,
                          hintText: "(Km)",
                          errorText: calcularStore.validateKmInicial);
                    },),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Hodômetro final: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Observer(builder: (_){
                      return CampoTextoValidate(
                          onChanged: calcularStore.setKmFinal,
                          /*controller: kmFinalControl,*/
                          hintText: "(Km)",
                          errorText: calcularStore.validateKmFinal);
                    })
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Quantidade abastecida: ",
                        style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    child: Observer(builder: (_){
                      return CampoTextoValidate(
                          onChanged: calcularStore.setLitros,
                          /*controller: litrosControl,*/
                          hintText: "Litros",
                          errorText: calcularStore.validateLitros);
                    })
                  ),
                ],),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Visibility(
                visible: _isVisible,
                child:Container(
                  height: alturaTela < 600 ? alturaTela * 0.2: alturaTela * 0.15,
                  width: larguraTela > 600 ? larguraTela * 0.4 : larguraTela * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.blueAccent[50],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            resultado, textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.center,
                child: Observer(builder: (_){
                  return CriaBotao(
                      hintText: "CALCULAR",
                      onPressed: calcularStore.isFormValid ? calculaMedia : null,
                      left: 32, top: 16, right: 32, bottom: 16);
                }),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      );
    }
}