import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nac_pokemon_mobx/screens/widget/pokemon_listview.dart';
import 'package:nac_pokemon_mobx/screens/widget/pokemon_listview_loading.dart';
import 'package:nac_pokemon_mobx/stores/pokemon_screen_store.dart';

class PokemonScreen extends StatefulWidget {
  PokemonScreen({Key key}) : super(key: key);

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PokemonScreenStore pokemonScreenStore = PokemonScreenStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (ctx) {
          if (pokemonScreenStore.isLoading) {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    onChanged: pokemonScreenStore.setFilter,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.only(
                        right: 30,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 24.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PokemonListViewLoading(),
                )
              ],
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    onChanged: pokemonScreenStore.setFilter,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.only(
                        right: 30,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 16.0, left: 24.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      pokemonScreenStore.init();
                    },
                    child: PokemonListView(
                      pokemons: pokemonScreenStore.filtered,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
