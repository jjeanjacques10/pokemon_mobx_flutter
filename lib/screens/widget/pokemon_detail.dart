import 'package:flutter/material.dart';
import 'package:nac_pokemon_mobx/models/pokemon_model.dart';

class PokemonListViewDetails extends StatelessWidget {
  const PokemonListViewDetails({
    Key key,
    @required this.pokemons,
  }) : super(key: key);

  final PokemonModel pokemons;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildImagemDetalhes(
            'assets/pokemons/' + pokemons.num.toString() + '.png'),
        _buildTitle(pokemons.variations[0].types.toString()),
        SizedBox(
          height: 16,
        ),
        _buildLineDetailIcons(
            pokemons.num.toString(),
            pokemons.variations[0].height.toString(),
            pokemons.variations[0].weight.toString()),
        SizedBox(
          height: 16,
        ),
        _buildSubtitle("Description"),
        SizedBox(
          height: 15,
        ),
        _buildTextDetails(pokemons.variations[0].description),
        SizedBox(
          height: 20,
        ),
        _buildSubtitle("Abilities"),
        SizedBox(
          height: 15,
        ),
        buildList(pokemons.variations[0].abilities),
        _buildSubtitle("Evolutions"),
        SizedBox(
          height: 15,
        ),
        buildList(pokemons.variations[0].evolutions),
      ],
    );
  }

  _buildImagemDetalhes(image) {
    return Image.asset(image);
  }

  _buildTitle(titulo) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          titulo,
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  _buildLineDetailIcons(id, height, weight) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          buildPokFeature(id, "ID"),
          buildPokFeature("$height m", "Height"),
          buildPokFeature("$weight Kg", "Weight"),
        ],
      ),
    );
  }

  _buildSubtitle(subtitulo) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        subtitulo,
        style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  _buildTextDetails(texto) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        texto,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 15,
        ),
      ),
    );
  }

  buildPokFeature(String value, String feature) {
    return Expanded(
      child: Container(
        height: 70,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200],
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              feature,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildList(items) {
    List<Widget> list = [];
    for (var i = 0; i < items.length; i++) {
      list.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          items[i],
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 15,
          ),
        ),
      ));
    }
    return Container(
      height: 80,
      child: Flexible(
        child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: list),
      ),
    );
  }
}
