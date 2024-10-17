// ************************************************************************************
// *
// * Curso de Flutter & Dart
// * SharedPreferences
// * (c) Daves Balthazar
// * https://youtube.com/davestecnologia
// *
// * Uso de SharedPreferences para armazenar dados simples e complexos
// * no dispositivo do usuário.
// *
// * Playlist do Curso de Flutter & Dart
// * https://www.youtube.com/playlist?list=PL5EmR7zuTn_Yu_YV2pT0h0843vRGiTMtx
// *
// ************************************************************************************

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Client {
  Client({
    required this.name,
    required this.phone,
  });

  String name;
  String phone;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory Client.fromJson(Map<String, dynamic> map) {
    return Client(
      name: map['name'],
      phone: map['phone'],
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  Client client = Client(name: 'Pedro', phone: '999999999');

  // Gravação de dados usando SharedPreferences
  //var name = 'Daves';
  // await prefs.setString('name', 'Daves');
  // await prefs.setInt('years_old', 100);
  // await prefs.setBool('logged', true);
  // await prefs.setDouble('salary', 1000.00);
  // await prefs.setStringList('lista', ['Maça', 'Banana', 'Uva']);
  await prefs.setString('client', jsonEncode(client.toJson()));

  var name = prefs.getString('name');
  print(name);
  print(prefs.getInt('years_old'));
  print(prefs.getBool('logged'));
  print(prefs.getDouble('salary'));
  var lista = prefs.getStringList('lista') ?? [];
  for (var item in lista) {
    print(item);
  }

  var jsonClient = prefs.getString('client');
  var myClient =
      Client.fromJson(jsonDecode(jsonClient ?? '') as Map<String, dynamic>);
  print(myClient.name);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
