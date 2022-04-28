import 'package:comparador_combustivel/widgets/criabotao.dart';
import 'package:comparador_combustivel/widgets/criacampotextovalidate.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CalcularRendimento extends StatefulWidget {
  @override
  _CalcularRendimentoState createState() => _CalcularRendimentoState();
}

class _CalcularRendimentoState extends State<CalcularRendimento> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController kmInicialControl = TextEditingController();
  TextEditingController kmFinalControl = TextEditingController();
  TextEditingController litrosControl = TextEditingController();

  var resultado ="";
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcular rendimento",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Form(
            key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Dados do veículo: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: larguraTela * 0.9,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Km inicial: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CampoTextoValidate(
                              controller: kmInicialControl,
                              hintText: "(Km)",
                              validator: validateKmInicial(),
                              onChanged: (value) {
                                setState(() {
                                  kmInicialControl;
                                });
                              },

                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Km final: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(15),
                          child: CampoTextoValidate(
                              controller: kmFinalControl,
                              hintText: "(Km)",
                              validator: validadeKmFinal(),
                              onChanged: (value) {
                                setState(() {
                                  kmFinalControl;
                                });
                              },
                            ),

                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Quantidade abastecida: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(15),
                          child: CampoTextoValidate(
                              controller: litrosControl,
                              hintText: "Litros",
                              validator: validateLitros(),
                              onChanged: (value) {
                                setState(() {
                                  litrosControl;
                                });
                              },
                          ),
                      ),
                    ],),
                  ),
                  const SizedBox(height: 15),
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
                                  color: Colors.white,
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
                    child: CriaBotao(
                          hintText: "Calcular",
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              calculaMedia();
                            }
                          },
                          left: 36, top: 10, right: 36, bottom: 10),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
          ),
        ),
      );
    }

  void calculaMedia(){
    var hodometroInicial = double.parse(kmInicialControl.text);
    var hodometroFinal = double.parse(kmFinalControl.text);
    var qtdLitros = double.parse(litrosControl.text.replaceAll(",", "."));
    final kmRodado = hodometroFinal - hodometroInicial;
    final mediaComb = kmRodado / qtdLitros;

    setState(() {
      resultado = "A média de consumo do seu veículo é: "
          "${mediaComb.toStringAsPrecision(3)} Km/L";
      _isVisible = true;
    });
  }

   String? validateKmInicial(){
    String setKmInicial = kmInicialControl.text;
    if(setKmInicial.isEmpty){
      return "Campo Obrigatório! ";
    } return null;
  }
   String? validadeKmFinal(){
    String? setKmInicial = kmInicialControl.text;
    String? setKmFinal = kmFinalControl.text;
    if(setKmInicial.isEmpty ){
      setKmInicial = "0";
    }
    if(setKmFinal.isEmpty){
      return "Campo Obrigatório! ";
    }else if(double.parse(setKmFinal) < double.parse(setKmInicial)){
      return "Km Final não pode ser menor que Km Inicial! ";
    }return null;
  }
   String? validateLitros(){
    String setLitros = litrosControl.text;
    if(setLitros.isEmpty){
      return "Campo Obrigatório! ";
    }return null;
  }
}

