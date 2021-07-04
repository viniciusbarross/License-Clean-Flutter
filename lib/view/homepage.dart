import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:license/componentes/cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LICENSE mobile'),
      ),
      body: Container(
        color: Colors.white70,
        child: ListView(
          children: [
            GestureDetector(
              child: buildRoundedCard(
                  Icons.people, 'Clientes', 'consulta, licenciamento'),
              onTap: () {},
            ),
            buildRoundedCard(Icons.people, 'Sair'),
          ],
        ),
      ),
    );
  }
}
