import 'package:flutter/material.dart';

import '../home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void initializeSplash() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Home()));
  }


  @override
  void initState() {
    initializeSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Image.asset('images/splash.png', width: 192),
        )
    );
  }
}