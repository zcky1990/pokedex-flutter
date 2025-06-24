import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'pokedex_page.dart';
import 'pokedex_page_view.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:pokedex/models/pokemon/named_api_resource.dart';
import 'package:pokedex/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokedexPageState extends State<PokedexPage> {
  final String _title = 'Poke Dex';
  bool _isLoading = false;
  Pokemon? result;
  List<NamedAPIResource> pokemonList = [];
  String? selectedPokemon;

  void handleDropdown(value) {
    setState(() {
      selectedPokemon = value;
    });
    _getData(value);
  }

  Future<void> _getData(String url) async {
    _isLoading = true;
    final data = await ApiService.fetchData<Pokemon>(
      path: url,
      fromJson: (json) => Pokemon.fromJson(json),
    );

    setState(() {
      _isLoading = false;
      result = data;
    });
  }

  Future<void> _getListData() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? configPokemonList =
        prefs.getStringList("pokemonListData");

    if (configPokemonList == null || configPokemonList.isEmpty) {
      print('No pokemon list found in SharedPreferences.');
      return;
    }

    final List<NamedAPIResource> loadedPokemonList =
        configPokemonList.map((jsonString) {
      final Map<String, dynamic> jsonMap =
          jsonDecode(jsonString) as Map<String, dynamic>;
      return NamedAPIResource.fromJson(jsonMap);
    }).toList();

    setState(() {
      pokemonList = loadedPokemonList;
    });
  }

  @override
  void initState() {
    super.initState();
    _getListData();
  }

  @override
  Widget build(BuildContext context) {
    return PokedexPageView(
        title: _title,
        getData: handleDropdown,
        isLoading: _isLoading,
        data: result,
        pokemonList: pokemonList,
        selectedPokemon: selectedPokemon);
  }
}
