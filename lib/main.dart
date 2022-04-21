import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: Home()),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seus dados";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está baixo do peso.";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está no peso ideal.";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está acima do peso.";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está com obesidade grau 1.";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está com obesidade grau 2.";
      } else if (imc >= 40.0) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está com obesidade grau 3.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text("Calculadora de IMG"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh_sharp),
            onPressed: () {
              _resetFields();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Os dados inseridos foram apagados.",
                  ),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 229, 245, 253),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.fitness_center,
                size: 120.0,
                color: Colors.indigo[600],
              ),
              TextFormField(
                controller: weightController,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "Insira seu peso.";
                //   } else {
                //     return null;
                //   }
                // },
                decoration: const InputDecoration(
                  labelText: "Peso (kg)",
                  icon: Icon(Icons.boy_outlined),
                ),
              ),
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(
                  labelText: "Altura (cm)",
                  icon: Icon(Icons.height_sharp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 80.0,
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      _calculate();
                    },

                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    // buttonStyle: TextStyle(color:  Colors.lightBlue[900]),
                  ),
                ),
              ),
              Text(_infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.indigo[600], fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}
