import 'package:mobx/mobx.dart';
import 'package:nac_pokemon_mobx/models/pokemon_model.dart';
import 'package:nac_pokemon_mobx/services/pokemon_service.dart';
part 'pokemon_detail_screen_store.g.dart'; //unificando

// Declarando a classe
class PokemonDetailScreenStore = _PokemonDetailScreenStore
    with _$PokemonDetailScreenStore;

abstract class _PokemonDetailScreenStore with Store {
  final PokemonService _pokemonService = PokemonService();
  List<PokemonModel> _itemPokemonLocal = <PokemonModel>[];

  _PokemonDetailScreenStore() {
    init();
  }

  init() async {
    isLoading = true;
    if (name != null) {
      _itemPokemonLocal = await _pokemonService.getByName(name);
      itemPokemon = _itemPokemonLocal.asObservable();
    }
    isLoading = false;
  }

  @observable
  ObservableList<PokemonModel> itemPokemon = <PokemonModel>[].asObservable();

  @observable
  bool isLoading = false;

  @observable
  String name;

  @action
  setName(value) async {
    name = value;
    init();
  }

  @computed
  List<PokemonModel> get pokemon {
    return itemPokemon;
  }
}
