import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cripto_moedas/config/app_settings.dart';
import 'package:flutter_cripto_moedas/repositories/conta_repository.dart';
import 'package:flutter_cripto_moedas/repositories/favoritas_repository.dart';
import 'package:flutter_cripto_moedas/repositories/moeda_repository.dart';
import 'package:flutter_cripto_moedas/services/auth_service.dart';
import 'package:flutter_cripto_moedas/widgets/auth_check.dart';

import 'package:provider/provider.dart';

import 'config/hive_config.dart';
import 'meu_aplicativo.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => MoedaRepository()),
        ChangeNotifierProvider(
            create: (context) => ContaRepository(
                  moedas: context.read<MoedaRepository>(),
                )),
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(
          create: (context) => FavoritasRepository(
            auth: context.read<AuthService>(),
            moedas: context.read<MoedaRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        home: AuthCheck(),
      ),
    ),
  );
}
