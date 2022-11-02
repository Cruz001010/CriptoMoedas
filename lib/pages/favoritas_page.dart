import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_cripto_moedas/repositories/favoritas_repository.dart';
import 'package:provider/provider.dart';

import '../widgets/moeda_card.dart';

class FavoritasPage extends StatefulWidget {
  const FavoritasPage({Key? key}) : super(key: key);

  @override
  State<FavoritasPage> createState() => _FavoritasPageState();
}

class _FavoritasPageState extends State<FavoritasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Moedas Favoritas'),
        ),
        body: Container(
            color: Colors.indigo.withOpacity(0.05),
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(12.0),
            child: Consumer<FavoritasRepository>(
              builder: (context, favoritas, child) {
                return favoritas.lista.isEmpty
                    ? ListTile(
                        leading: Icon(Icons.star),
                        title: Text('Ainda não há moedas favoritas'),
                      )
                    : ListView.builder(
                        itemCount: favoritas.lista.length,
                        itemBuilder: (_, index) {
                          return MoedaCard(moeda: favoritas.lista[index]);
                        },
                      );
              },
            )));
  }
}
