// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonScreenStore on _PokemonScreenStore, Store {
  Computed<List<PokemonModel>> _$filteredComputed;

  @override
  List<PokemonModel> get filtered =>
      (_$filteredComputed ??= Computed<List<PokemonModel>>(() => super.filtered,
              name: '_PokemonScreenStore.filtered'))
          .value;
  Computed<int> _$quantidadeComputed;

  @override
  int get quantidade =>
      (_$quantidadeComputed ??= Computed<int>(() => super.quantidade,
              name: '_PokemonScreenStore.quantidade'))
          .value;

  final _$filtroAtom = Atom(name: '_PokemonScreenStore.filtro');

  @override
  String get filtro {
    _$filtroAtom.reportRead();
    return super.filtro;
  }

  @override
  set filtro(String value) {
    _$filtroAtom.reportWrite(value, super.filtro, () {
      super.filtro = value;
    });
  }

  final _$listaPokemonAtom = Atom(name: '_PokemonScreenStore.listaPokemon');

  @override
  ObservableList<PokemonModel> get listaPokemon {
    _$listaPokemonAtom.reportRead();
    return super.listaPokemon;
  }

  @override
  set listaPokemon(ObservableList<PokemonModel> value) {
    _$listaPokemonAtom.reportWrite(value, super.listaPokemon, () {
      super.listaPokemon = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PokemonScreenStore.isLoading');

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

  final _$findAllCoursesAsyncAction =
      AsyncAction('_PokemonScreenStore.findAllCourses');

  @override
  Future findAllCourses() {
    return _$findAllCoursesAsyncAction.run(() => super.findAllCourses());
  }

  final _$_PokemonScreenStoreActionController =
      ActionController(name: '_PokemonScreenStore');

  @override
  dynamic setFilter(dynamic value) {
    final _$actionInfo = _$_PokemonScreenStoreActionController.startAction(
        name: '_PokemonScreenStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_PokemonScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtro: ${filtro},
listaPokemon: ${listaPokemon},
isLoading: ${isLoading},
filtered: ${filtered},
quantidade: ${quantidade}
    ''';
  }
}
