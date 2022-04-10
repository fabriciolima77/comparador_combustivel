import 'package:comparador_combustivel/widgets/criabotao.dart';
import 'package:comparador_combustivel/widgets/criacampotexto.dart';
import 'package:comparador_combustivel/widgets/criacampotextovalidate.dart';
import 'package:flutter/material.dart';

class CompararCombustivel extends StatefulWidget {
  const CompararCombustivel({Key? key}) : super(key: key);

  @override
  _CompararCombustivelState createState() => _CompararCombustivelState();
}

class _CompararCombustivelState extends State<CompararCombustivel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController rendEtanolController = TextEditingController();
  TextEditingController rendGasolinaController = TextEditingController();
  TextEditingController precoEtanolController = TextEditingController();
  TextEditingController precoGasolinaController = TextEditingController();

  var texto = "";
  bool _isVisible = false;
  var corResultado = Colors.white;

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comparar combustível",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Dados do veículo: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: larguraTela * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Rendimento do veículo com Etanol: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: CampoTexto(
                        controller: rendEtanolController,
                        hintText: "(Km/L)",
                      )),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Rendimento do veículo com Gasolina: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: CampoTexto(
                        controller: rendGasolinaController,
                        hintText: "(Km/L)",
                      )),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Preço dos combustíveis: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
                child: SizedBox(
                  width: larguraTela * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Preço Etanol: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: CampoTextoValidate(
                            controller: precoEtanolController,
                            hintText: "R\$",
                            validator: validadePrecoEtanol(),
                            onChanged: (value) {
                              setState(() {
                                precoEtanolController;
                              });
                            },
                          )),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Preço Gasolina: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: CampoTextoValidate(
                            controller: precoGasolinaController,
                            hintText: "R\$",
                            validator: validatePrecoGasolina(),
                            onChanged: (value) {
                              setState(() {
                                precoGasolinaController;
                              });
                            },
                          )),
                    ],
                  ),
                ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: _isVisible,
              child: Container(
                height:
                    alturaTela < 600 ? alturaTela * 0.30 : alturaTela * 0.15,
                width:
                    larguraTela > 600 ? larguraTela * 0.4 : larguraTela * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: corResultado),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Text(
                        texto,
                        textAlign: TextAlign.center,
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
              child: CriaBotao(
                  hintText: "Comparar",
                  onPressed: (){
                    if(rendGasolinaController.text.isEmpty && rendEtanolController.text.isEmpty && _formKey.currentState!.validate()){
                      _calculaSemRendimento();
                    }else{
                      _calculaRendimento();
                    }
                  },
                  left: 36.0,
                  top: 12.0,
                  right: 36.0,
                  bottom: 12.0),
            ),
            Padding(padding: EdgeInsets.all(alturaTela * 0.0136)),
          ],
        ),
      ),
    );
  }

  void _calculaRendimento() {
    var rendEtanol =
        double.parse(rendEtanolController.text.replaceAll(",", "."));
    var rendGasolina =
        double.parse(rendGasolinaController.text.replaceAll(",", "."));
    var valorEtanol =
        double.parse(precoEtanolController.text.replaceAll(",", "."));
    var valorGasolina =
        double.parse(precoGasolinaController.text.replaceAll(",", "."));
    final rendimento = (rendEtanol / rendGasolina) * 100;
    final percentEtanol = (valorEtanol / valorGasolina) * 100;

    setState(() {
      if (rendimento >= percentEtanol) {
        texto = "O seu melhor combustível é: Etanol !\n"
            "rendimento veículo: "
            "(${rendimento.toStringAsPrecision(3)})%\n"
            "rendimento sobre o preço: "
            "(${percentEtanol.toStringAsPrecision(3)})%";
        _isVisible = true;
        corResultado = Colors.greenAccent;
      } else {
        texto = "O seu melhor combustível é: Gasolina !\n"
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
    var valorEtanol =
        double.parse(precoEtanolController.text.replaceAll(",", "."));
    var valorGasolina =
        double.parse(precoGasolinaController.text.replaceAll(",", "."));
    final percentEtanol = (valorEtanol / valorGasolina) * 100;

    setState(() {
      if (percentEtanol < 70) {
        texto = "O seu melhor combustível é: Etanol !\n"
            "Utilize o rendimento do veículo para melhores resultados.";
        _isVisible = true;
        corResultado = Colors.greenAccent;
      } else if (percentEtanol >= 70) {
        texto = "O seu melhor combustível é: Gasolina !\n"
            "Utilize o rendimento do veículo para melhores resultados.";
        _isVisible = true;
        corResultado = Colors.redAccent;
      }
    });
  }

  String? validatePrecoGasolina() {
    String setPrecoGasolina = precoGasolinaController.text;
    if (setPrecoGasolina.isEmpty) {
      return "Campo Obrigatório! ";
    }return null;
  }

  String? validadePrecoEtanol() {
    String setPrecoEtanol = precoEtanolController.text;
    if (setPrecoEtanol.isEmpty) {
      return "Campo Obrigatório! ";
    }
    return null;
  }
}
