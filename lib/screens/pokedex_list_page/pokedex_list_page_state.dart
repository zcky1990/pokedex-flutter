import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'pokedex_list_page.dart';
import 'pokedex_list_page_view.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:pokedex/models/pokemon/named_api_resource.dart';
import 'package:pokedex/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokedexListPageState extends State<PokedexListPage> {
  final String _title = 'PokeDex';
  bool _isLoading = false;
  Pokemon? result;
  List<NamedAPIResource> pokemonList = [];
  NamedAPIResource? selectedPokemon;

  void handleDropdown(NamedAPIResource? value) {
    setState(() {
      selectedPokemon = value;
    });
    if (value != null) {
      _getData(value.url);
    } else {
      // Handle case where nothing is selected or cleared
      setState(() {
        result = null; // Clear displayed Pokemon if nothing is selected
      });
    }
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
    return PokedexListPageView(
        title: _title,
        getData: handleDropdown,
        isLoading: _isLoading,
        data: result,
        pokemonList: pokemonList,
        selectedPokemon: selectedPokemon);
  }
}
