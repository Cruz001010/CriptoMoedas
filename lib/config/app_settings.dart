import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  // late SharedPreferences _prefs;
  late BoxBorder box;
  Map<String, String> locale = {
    'name': 'R\$',
    'locale': 'pt_BR',
  };
  late SharedPreferences _prefs;

  AppSettings() {
    _startSettings();
  }
// inicializacao e para ler o locale que o usario apertou
  _startSettings() async {
    await _startPreferences();
    await _readLocale();
  }

  Future<void> _startPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // _prefs = await SharedPreferences.getInstance();
  }

  _readLocale() {
    final local = _prefs.getString('local') ?? 'pt_BR';
    final name = _prefs.getString('local') ?? 'pt_BR';
    locale = {
      'locale': local,
      'name': name,
    };
    //final loc = box.get('name') ?? 'R\$';
    notifyListeners();
  }

  setLocale(String local, String name) async {
    await _prefs.setString('local', local);
    await _prefs.setString('name', name);
    await _readLocale();
  }
}
