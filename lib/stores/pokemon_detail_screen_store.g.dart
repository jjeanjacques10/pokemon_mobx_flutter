// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailScreenStore on _PokemonDetailScreenStore, Store {
  Computed<List<PokemonModel>> _$pokemonComputed;

  @override
  List<PokemonModel> get pokemon =>
      (_$pokemonComputed ??= Computed<List<PokemonModel>>(() => super.pokemon,
              name: '_PokemonDetailScreenStore.pokemon'))
          .value;

  final _$itemPokemonAtom = Atom(name: '_PokemonDetailScreenStore.itemPokemon');

  @override
  ObservableList<PokemonModel> get itemPokemon {
    _$itemPokemonAtom.reportRead();
    return super.itemPokemon;
  }

  @override
  set itemPokemon(ObservableList<PokemonModel> value) {
    _$itemPokemonAtom.reportWrite(value, super.itemPokemon, () {
      super.itemPokemon = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PokemonDetailScreenStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$nameAtom = Atom(name: '_PokemonDetailScreenStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$setNameAsyncAction = AsyncAction('_PokemonDetailScreenStore.setName');

  @override
  Future setName(dynamic value) {
    return _$setNameAsyncAction.run(() => super.setName(value));
  }

  @override
  String toString() {
    return '''
itemPokemon: ${itemPokemon},
isLoading: ${isLoading},
name: ${name},
pokemon: ${pokemon}
    ''';
  }
}
