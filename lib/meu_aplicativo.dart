import 'package:flutter/material.dart';
import 'package:flutter_cripto_moedas/pages/home_page.dart';
import 'package:flutter_cripto_moedas/widgets/auth_check.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key, required bool debugShowCheckedModeBanner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moedasbase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: AuthCheck(),
    );
  }
}
