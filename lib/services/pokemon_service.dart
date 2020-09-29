import 'package:nac_pokemon_mobx/models/pokemon_model.dart';
import 'package:dio/dio.dart';
import 'package:nac_pokemon_mobx/services/Service_config.dart';

class PokemonService {
  static final String _endpoint = "https://pokemon-nac.herokuapp.com/api";

  static final String _resource = '/pokedex';

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<PokemonModel>> findAll() async {
    //await Future.delayed(Duration(seconds: 20));

    List<PokemonModel> lista = new List<PokemonModel>();

    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            lista.add(
              PokemonModel.fromMap(value),
            );
          },
        );
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }

    return lista;
  }

  Future<int> create(PokemonModel pokemonModel) async {
    try {
      pokemonModel.num = 0;
      Response response = await service.create().post(
            _resource,
            data: pokemonModel.toMap(),
          );

      if (response.statusCode == 201) {
        var retorno = (response.data["num"] is String)
            ? int.parse(response.data["num"])
            : response.data["num"];
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<List<PokemonModel>> getByName(String name) async {
    //await Future.delayed(Duration(seconds: 20));
    List<PokemonModel> lista = new List<PokemonModel>();

    try {
      String endpoint = _resource + "/" + name;

      Response response = await service.create().get(endpoint);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            lista.add(
              PokemonModel.fromMap(value),
            );
          },
        );
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }

    return lista;
  }

  Future<int> update(PokemonModel pokemonModel) async {
    try {
      String endpoint = _resource + "/" + pokemonModel.num.toString();

      Response response = await service.create().put(
            endpoint,
            data: pokemonModel.toMap(),
          );

      var retorno = (response.data["num"] is String)
          ? int.parse(response.data["num"])
          : response.data["num"];
      return retorno;
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<void> delete(PokemonModel pokemonModel) async {
    try {
      String endpoint = _resource + "/" + pokemonModel.name;

      Response response = await service.create().delete(
            endpoint,
          );

      if (response.statusCode != 200) {
        throw Exception("Não foi possível excluir o pokemon!");
      }
    } catch (error) {
      throw error;
    }
  }
}
