import 'package:flutter/material.dart';
import 'main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    title: "Comparador de Combustível",
  ));
}

class CompararCombustivel extends StatefulWidget {
  const CompararCombustivel({Key? key}) : super(key: key);

  @override
  _CompararCombustivelState createState() => _CompararCombustivelState();
}

class _CompararCombustivelState extends State<CompararCombustivel> {
  TextEditingController rendimentoEtanol = TextEditingController();
  TextEditingController rendimentoGasolina = TextEditingController();
  TextEditingController precoEtanol = TextEditingController();
  TextEditingController precoGasolina = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var texto = "";
  bool _isVisible = false;
  var corResultado = Colors.white;

  void _resetField(){
    rendimentoEtanol.text = "";
    rendimentoGasolina.text ="";
    precoEtanol.text = "";
    precoGasolina.text = "";
    texto = "";
    _isVisible = false;
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculaRendimento(){
    var rendEtanol = double.parse(rendimentoEtanol.text);
    var rendGasolina = double.parse(rendimentoGasolina.text);
    var valorEtanol = double.parse(precoEtanol.text.replaceAll(",", "."));
    var valorGasolina = double.parse(precoGasolina.text.replaceAll(",", "."));
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

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("Comparar combustível",
            style: const TextStyle(
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
                    child: buildCampoText(
                        '',
                        "(Km/L)",
                        rendimentoEtanol,
                        TextInputType.text,
                        Colors.blueAccent[100]),
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
                    child: buildCampoText(
                        '',
                        "(Km/L)",
                        rendimentoGasolina,
                        TextInputType.text,
                        Colors.blueAccent[100]),
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
                height: alturaTela < 600 ? alturaTela * 0.45: alturaTela * 0.3,
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
                    child: buildCampoText(
                        '#,##',
                        "R\$",
                        precoEtanol,
                        TextInputType.number,
                        Colors.blueAccent[100]),
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
                    child: buildCampoText(
                        '#,##',
                        "R\$",
                        precoGasolina,
                        TextInputType.number,
                        Colors.blueAccent[100]),
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
                child: buildBotao("CALCULAR",
                    _calculaRendimento,
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
      contentPadding: const EdgeInsets.all(10.0),
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

Widget buildBotao(String text, function, double left, double top, double right, double bottom){
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