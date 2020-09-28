import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PokemonListViewLoading extends StatelessWidget {
  const PokemonListViewLoading({
    Key key,
  }) : super(key: key);

  static const _highLightColor = Color.fromRGBO(64, 75, 96, .1);
  static const _baseColor = Colors.red;
  static const _duration = Duration(milliseconds: 4000);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height),
      ),
      itemCount: 10,
      itemBuilder: (BuildContext ctx, int index) {
        return cardPokemon();
      },
    );
  }

  Card cardPokemon() {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Shimmer.fromColors(
                        highlightColor: _highLightColor,
                        baseColor: _baseColor,
                        period: _duration,
                        child: Container(
                          height: 15,
                          width: 25,
                          color: _highLightColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 9.0),
                      Shimmer.fromColors(
                        highlightColor: _highLightColor,
                        baseColor: _baseColor,
                        period: _duration,
                        child: Container(
                          height: 25,
                          width: 100,
                          color: _highLightColor,
                        ),
                      ),
                      SizedBox(height: 9.0),
                      Shimmer.fromColors(
                        highlightColor: _highLightColor,
                        baseColor: _baseColor,
                        period: _duration,
                        child: Container(
                          height: 100,
                          width: 150,
                          color: _highLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
