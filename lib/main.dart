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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "texto aleatorio de teste !!",
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
            child: Column(
              children: <Widget>[
                Icon(Icons.fitness_center,
                    size: 120.0, color: Colors.indigo[600]),
                TextFormField(
                    decoration: const InputDecoration(
                  labelText: "Peso (kg)",
                )),
                TextFormField(
                  decoration: InputDecoration(labelText: "Altura (cm)"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      // buttonStyle: TextStyle(color:  Colors.lightBlue[900]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
 //falta estilizar a cord do botao *************************