import 'package:flutter/material.dart';
import 'comparar_combustivel.dart';
import 'calcular_rendimento.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    title: "Comparador de Combustível",
    theme: ThemeData(
      primarySwatch: Colors.grey,
      fontFamily: 'ProductSans',
    ),
    initialRoute: '/Home',
    routes: {
      '/CalcularRendimento': (context)=> CalcularRendimento(),
      '/Home': (context)=> Home(),
      '/CompararCombustivel': (context)=> const CompararCombustivel(),
    },
  ));
}

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {

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
        title: Text("Comparador de combustíveis",
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Comparar combustível",
                            style: TextStyle(fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: ElevatedButton(
                            child: Image.asset('images/comparar.png',
                              width: larguraTela * 0.54,
                              height: alturaTela * 0.24,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                                onPrimary: Colors.white
                            ),
                            onPressed:() => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CompararCombustivel()))
                        ),
                      ),
                    ],
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
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Calcular rendimento",
                            style: TextStyle(fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: ElevatedButton(
                            child: Image.asset('images/hodometro.png',
                              width: larguraTela * 0.54,
                              height: alturaTela * 0.24,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.white
                            ),
                            onPressed:() => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CalcularRendimento()))
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}