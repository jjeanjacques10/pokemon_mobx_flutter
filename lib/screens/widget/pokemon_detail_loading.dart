import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PokemonDetailLoading extends StatelessWidget {
  const PokemonDetailLoading({
    Key key,
  }) : super(key: key);

  static const _highLightColor = Color.fromRGBO(64, 75, 96, .1);
  static const _baseColor = Colors.red;
  static const _duration = Duration(milliseconds: 4000);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildImagemDetalhes(),
        SizedBox(
          height: 16,
        ),
        _buildTitle(),
        SizedBox(
          height: 16,
        ),
        _buildLineDetailIcons(),
        SizedBox(
          height: 16,
        ),
        _buildSubtitle("Description"),
        SizedBox(
          height: 15,
        ),
        _buildTextDetails(),
        SizedBox(
          height: 20,
        ),
        _buildSubtitle("Abilities"),
        SizedBox(
          height: 15,
        ),
        buildList(),
        _buildSubtitle("Evolutions"),
        SizedBox(
          height: 15,
        ),
        buildList(),
      ],
    );
  }

  _buildImagemDetalhes() {
    return Shimmer.fromColors(
      highlightColor: _highLightColor,
      baseColor: _baseColor,
      period: _duration,
      child: Container(
        height: 350,
        width: 40,
        color: _highLightColor,
      ),
    );
  }

  _buildTitle() {
    return Shimmer.fromColors(
      highlightColor: _highLightColor,
      baseColor: _baseColor,
      period: _duration,
      child: Container(
        height: 30,
        width: 40,
        color: _highLightColor,
      ),
    );
  }

  _buildLineDetailIcons() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          buildPokFeature(),
          SizedBox(
            width: 15,
          ),
          buildPokFeature(),
          SizedBox(
            width: 15,
          ),
          buildPokFeature(),
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

  _buildTextDetails() {
    return Shimmer.fromColors(
      highlightColor: _highLightColor,
      baseColor: _baseColor,
      period: _duration,
      child: Container(
        height: 25,
        width: 150,
        color: _highLightColor,
      ),
    );
  }

  buildPokFeature() {
    return Shimmer.fromColors(
      highlightColor: _highLightColor,
      baseColor: _baseColor,
      period: _duration,
      child: Container(
        height: 50,
        width: 100,
        color: _highLightColor,
      ),
    );
  }

  buildList() {
    return Shimmer.fromColors(
      highlightColor: _highLightColor,
      baseColor: _baseColor,
      period: _duration,
      child: Container(
        height: 100,
        width: 150,
        color: _highLightColor,
      ),
    );
  }
}
