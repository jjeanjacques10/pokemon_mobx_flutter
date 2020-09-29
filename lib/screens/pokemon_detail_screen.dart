import 'package:flutter/material.dart';
import 'package:nac_pokemon_mobx/models/pokemon_model.dart';
import 'package:nac_pokemon_mobx/screens/widget/pokemon_detail.dart';

class PokemonDetailScreen extends StatefulWidget {
  PokemonDetailScreen({Key key}) : super(key: key);

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    PokemonModel pokemon = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
          backgroundColor: Colors.white,
        ),
        body: PokemonDetail(pokemon: pokemon));
  }
}
