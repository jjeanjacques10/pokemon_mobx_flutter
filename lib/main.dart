import 'package:flutter/material.dart';
import 'package:nac_pokemon_mobx/screens/pokemon_detail_screen.dart';
import 'package:nac_pokemon_mobx/screens/pokemon_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => PokemonScreen(),
        "/details": (context) => PokemonDetailScreen(),
      },
    );
  }
}
