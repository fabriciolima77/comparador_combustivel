import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: use_key_in_widget_constructors
class CalcularRendimento extends StatefulWidget {
  @override
  _CalcularRendimentoState createState() => _CalcularRendimentoState();
}

class _CalcularRendimentoState extends State<CalcularRendimento> {
  TextEditingController kmInicial = TextEditingController();
  TextEditingController kmFinal = TextEditingController();
  TextEditingController litros = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var resultado ="";
  bool _isVisible = false;

  void _resetField(){
    kmInicial.text = "";
    kmFinal.text ="";
    litros.text = "";
    resultado = "";
    _isVisible = false;
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  void calculaMedia(){
    var hodometroInicial = double.parse(kmInicial.text);
    var hodometroFinal = double.parse(kmFinal.text);
    var qtdLitros = double.parse(litros.text.replaceAll(",", "."));
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
        actions: <Widget>[
          IconButton(
              onPressed: _resetField,
              icon: const Icon(Icons.refresh, color: Colors.black,))
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                height: alturaTela < 600 ? alturaTela * 0.55: alturaTela * 0.4,
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
                    child: buildCampoText(
                        '######',
                        "(Km)",
                        kmInicial,
                        TextInputType.number,
                        Colors.blueAccent[100]),
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
                    child: buildCampoText(
                        '######',
                        "(Km)",
                        kmFinal,
                        TextInputType.number,
                        Colors.blueAccent[100]),
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
                    child: buildCampoText(
                        '',
                        "Litros",
                        litros,
                        TextInputType.number,
                        Colors.blueAccent[100]),
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
              Padding(padding: EdgeInsets.all(alturaTela * 0.0136)),
              Container(
                alignment: Alignment.center,
                child: buildBotao("CALCULAR",
                   calculaMedia,
                    16, 8, 16, 8
                ),
              ),
              Padding(padding: EdgeInsets.all(alturaTela * 0.0136)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCampoText(formato ,String text, TextEditingController c, keyboard, corBorda, ){
  var maskFormatter = MaskTextInputFormatter(mask: formato, filter: { "#": RegExp(r'[0-9]') });
  return TextField(
    keyboardType: keyboard,
    maxLines: 1,
    inputFormatters: [
      maskFormatter
    ],
    decoration: InputDecoration(
      hintText: text,
      contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      hintStyle: TextStyle(color: Colors.grey[600]),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: corBorda),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    style: const TextStyle(color: Colors.black),
    controller: c,
  );
}

Widget buildBotao(String text, function, double left, double top, double right, double bottom, ){
  return ElevatedButton(
    child: Text(text, style: const TextStyle(fontSize: 20, color: Colors.white),),
    onPressed: function,
    style: ElevatedButton.styleFrom(
      primary: Colors.blueAccent[400],
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
