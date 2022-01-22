import 'package:comparador_combustivel/stores/comparar_store.dart';
import 'package:comparador_combustivel/widgets/criabotao.dart';
import 'package:comparador_combustivel/widgets/criacampotexto.dart';
import 'package:comparador_combustivel/widgets/criacampotextovalidate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CompararCombustivel extends StatefulWidget {
  const CompararCombustivel({Key? key}) : super(key: key);


  @override
  _CompararCombustivelState createState() => _CompararCombustivelState();
}

class _CompararCombustivelState extends State<CompararCombustivel> {

  CompararStore compararStore = CompararStore();

  var texto = "";
  bool _isVisible = false;
  var corResultado = Colors.white;

  void _calculaRendimento(){
    var rendEtanol = double.parse(compararStore.rendEtanol.replaceAll(",", "."));
    var rendGasolina = double.parse(compararStore.rendGasolina.replaceAll(",", "."));
    var valorEtanol = double.parse(compararStore.precoEtanol.replaceAll(",", "."));
    var valorGasolina = double.parse(compararStore.precoGasolina.replaceAll(",", "."));
    final rendimento = (rendEtanol / rendGasolina) * 100;
    final percentEtanol = (valorEtanol / valorGasolina) * 100;

    setState(() {
      if(rendimento >= percentEtanol){
        texto = "Etanol é mais vantajoso!\n"
            "rendimento veículo: "
            "(${rendimento.toStringAsPrecision(3)})%\n"
            "rendimento sobre o preço: "
            "(${percentEtanol.toStringAsPrecision(3)})%";
        _isVisible = true;
        corResultado = Colors.greenAccent;
      }else{
        texto = "Gasolina é mais vantajosa!\n"
            "rendimento veículo: "
            "(${rendimento.toStringAsPrecision(3)})%\n"
            "rendimento sobre o preço: "
            "(${percentEtanol.toStringAsPrecision(3)})%";
        _isVisible = true;
        corResultado = Colors.redAccent;
      }
    });
  }

  void _calculaSemRendimento() {
    var valorEtanol = double.parse(compararStore.precoEtanol.replaceAll(",", "."));
    var valorGasolina = double.parse(compararStore.precoGasolina.replaceAll(",", "."));
    final percentEtanol = (valorEtanol / valorGasolina) * 100;

    setState(() {
      if (percentEtanol < 70) {
        texto = "Etanol é mais vantajoso!\n"
            "rendimento sobre o preço: "
            "(${percentEtanol.toStringAsPrecision(3)})%"
            "Utilize o rendimento do veículo para melhores resultados.";
        _isVisible = true;
        corResultado = Colors.greenAccent;
      } else
      if (percentEtanol >= 70) {
        texto = "Gasolina é mais vantajosa!\n"
            "Utilize o rendimento do veículo para melhores resultados.";
        _isVisible = true;
        corResultado = Colors.redAccent;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comparar combustível",
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
                height: alturaTela < 600 ? alturaTela * 0.50 : alturaTela * 0.3,
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
                      child: Text("Rendimento do veículo com Etanol: ",
                        style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Observer(builder: (_){
                      return CampoTexto(
                          onChanged: compararStore.setRendEtanol,
                          hintText: "(Km/L)",
                      );
                    })
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Rendimento do veículo com Gasolina: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Observer(builder: (_){
                      return CampoTexto(
                          onChanged: compararStore.setRendGasolina,
                          hintText: "(Km/L)",
                      );
                    })
                  ),
                ],),
              ),
               const Padding(
                padding: EdgeInsets.fromLTRB(35, 10, 10, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Preço dos combustíveis: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: alturaTela < 600 ? alturaTela * 0.5: alturaTela * 0.4,
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
                      child: Text("Preço Etanol: ",
                        style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Observer(builder: (_){
                      return CampoTextoValidate(
                          onChanged: compararStore.setPrecoEtanol,
                          hintText: "R\$",
                          errorText: compararStore.validateEtanol
                      );
                    })
                  ),
                   const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Preço Gasolina: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Observer(builder: (_){
                      return CampoTextoValidate(
                          onChanged: compararStore.setPrecoGasolina,
                          hintText: "R\$",
                          errorText: compararStore.validateGasolina);
                    }),
                  ),
                ],),
              ),
              Padding(padding: EdgeInsets.all(alturaTela * 0.0136)),
              Visibility(
                visible: _isVisible,
                child:Container(
                  height: alturaTela < 600 ? alturaTela * 0.30: alturaTela * 0.15,
                  width: larguraTela > 600 ? larguraTela * 0.4 : larguraTela * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: corResultado
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          child: Text(
                            texto, textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(alturaTela * 0.0136)),
              Container(
                alignment: Alignment.center,
                child: Observer(builder: (_){
                  return CriaBotao(
                      hintText: "CALCULAR",
                      onPressed: compararStore.isValid ?
                      compararStore.rendGasolina.isEmpty && compararStore.rendEtanol.isEmpty
                          ? _calculaSemRendimento : _calculaRendimento : null,
                      left: 32.0, top: 16.0, right: 32.0, bottom: 16.0);
                })
              ),
              Padding(padding: EdgeInsets.all(alturaTela * 0.0136)),
            ],
          ),
        ),
     );
  }
}