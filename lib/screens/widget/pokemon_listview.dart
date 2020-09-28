import 'package:flutter/material.dart';
import 'package:nac_pokemon_mobx/models/pokemon_model.dart';
import 'package:nac_pokemon_mobx/services/pokemon_service.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({
    Key key,
    @required this.pokemons,
  }) : super(key: key);

  final List<PokemonModel> pokemons;

  @override
  _PokemonListViewState createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height),
      ),
      itemCount: widget.pokemons == null ? 0 : widget.pokemons.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Dismissible(
          key: Key(widget.pokemons[index].num.toString()),
          child: cardPokemon(widget.pokemons[index], context),
          direction: DismissDirection.endToStart,
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onDismissed: (direction) {
            PokemonService().delete(widget.pokemons[index]);
            widget.pokemons.removeAt(index);
            setState(() {});
          },
        );
      },
    );
  }

  Card cardPokemon(PokemonModel pokemon, BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              child: Column(
                children: [
                  SizedBox(height: 9.0),
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset(
                        'assets/pokemons/' + pokemon.num.toString() + '.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          pokemon.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 9.0),
                        Text(
                          pokemon.variations[0].description.toString(),
                          textAlign: TextAlign.start,
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () => {
                    Navigator.pushNamed(context, '/details',
                        arguments: pokemon.name)
                  }),
        ],
      ),
    );
  }
}
