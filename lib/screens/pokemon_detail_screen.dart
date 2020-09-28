import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nac_pokemon_mobx/screens/widget/pokemon_detail.dart';
import 'package:nac_pokemon_mobx/screens/widget/pokemon_detail_loading.dart';
import 'package:nac_pokemon_mobx/screens/widget/pokemon_listview_loading.dart';
import 'package:nac_pokemon_mobx/stores/pokemon_detail_screen_store.dart';
//import 'package:nac_pokemon_mobx/stores/pokemon_detail_screen_store.dart';

class PokemonDetailScreen extends StatefulWidget {
  PokemonDetailScreen({Key key}) : super(key: key);

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PokemonDetailScreenStore pokemonDetailScreenStore =
      PokemonDetailScreenStore();

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context).settings.arguments;
    pokemonDetailScreenStore.setName(name);
    //PokemonModel pokemonModel = ().pokemon;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.white,
      ),
      body: Observer(
        builder: (ctx) {
          if (pokemonDetailScreenStore.isLoading) {
            return PokemonListViewDetailsLoading();
          } else {
            return PokemonListViewDetails(
                pokemons: pokemonDetailScreenStore.pokemon[0]);
          }
        },
      ),
    );
  }
}
