import 'package:comparador_combustivel/calcular_rendimento.dart';
import 'package:comparador_combustivel/comparar_combustivel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("Melhor Combustível",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(10)),
              Container(
                height: alturaTela * 0.36,
                width: larguraTela * 0.9,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: ElevatedButton(
                          child: Image.asset('images/comparar.png',
                            width: larguraTela * 0.54,
                            height: alturaTela * 0.24,
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 4,
                              primary: Colors.black /*const Color(0xFF201E1E)*/,
                              onPrimary: Colors.black /*const Color(0xFF201E1E)*/,
                          ),
                          onPressed:() => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CompararCombustivel()))
                      ),
                    ),
              ),
              //segundo icone
              Container(
                height: alturaTela * 0.36,
                width: larguraTela * 0.9,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: ElevatedButton(
                          child: Image.asset('images/hodometro.png',
                            width: larguraTela * 0.54,
                            height: alturaTela * 0.24,
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 4,
                              primary: Colors.black /*const Color(0xFF201E1E)*/,
                              onPrimary: Colors.black /*const Color(0xFF201E1E)*/,
                          ),
                          onPressed:() => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CalcularRendimento()))
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}