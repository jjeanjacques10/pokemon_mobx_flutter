import 'package:mobx/mobx.dart';
import 'package:nac_pokemon_mobx/models/pokemon_model.dart';
import 'package:nac_pokemon_mobx/services/pokemon_service.dart';
part 'pokemon_screen_store.g.dart'; //unificando

// Declarando a classe
class PokemonScreenStore = _PokemonScreenStore with _$PokemonScreenStore;

abstract class _PokemonScreenStore with Store {
  final PokemonService _pokemonService = PokemonService();
  List<PokemonModel> _listaPokemonLocal = <PokemonModel>[];

  _PokemonScreenStore() {
    init();
  }

  init() async {
    isLoading = true;
    _listaPokemonLocal = await _pokemonService.findAll();
    listaPokemon = _listaPokemonLocal.asObservable();
    isLoading = false;
  }

  @observable
  String filtro = "";

  @observable
  ObservableList<PokemonModel> listaPokemon = <PokemonModel>[].asObservable();

  @observable
  bool isLoading = false;

  @action
  findAllCourses() async {
    init();
  }

  @action
  setFilter(value) {
    filtro = value;
  }

  @computed
  List<PokemonModel> get filtered {
    if (filtro.isEmpty) {
      return listaPokemon;
    } else {
      var lista = listaPokemon
          .where((pokemon) => pokemon.name.toLowerCase().contains(
                filtro.toLowerCase(),
              ))
          .toList();
      return lista;
    }
  }

  @computed
  int get quantidade {
    return listaPokemon.length;
  }
}
