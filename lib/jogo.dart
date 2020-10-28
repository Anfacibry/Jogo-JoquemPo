import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");

  var _resultado = "Escolha uma das opções abaixo";

  void escolhas(String escolhaUsuario) {
    var maos = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = maos[numero];
    print("Esolha do usuario: $escolhaUsuario");
    print(" Escolha do App: $escolhaApp");

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        this._resultado = "Parabens, você ganhou! :)";
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      setState(() {
        this._resultado = "Que pena, você perdeu :(";
      });
    } else {
      setState(() {
        this._resultado = "Empatados!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Jokenpo"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "Escolha do app:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image(
              image: this._imagemApp,
              height: 100,
              width: 100,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                this._resultado,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => escolhas("pedra"),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 100,
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => escolhas("papel"),
                  child: Image.asset(
                    "images/papel.png",
                    height: 100,
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => escolhas("tesoura"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
