import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex/service/api_service.dart';
import 'dart:async';
import 'dart:convert';
import 'landing_page.dart';
import 'landing_page_view.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/models/pokemon/named_api_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  List<NamedAPIResource> pokemonList = [];
  late AnimationController _controller;
  late Animation<double> _animation;

  Future<void> _getListData() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoading = true;
    String urls = dotenv.env['API_URL'] ?? '';

    final listPokemonData = await ApiService.fetchData<PokemonList>(
      path: urls,
      fromJson: (json) => PokemonList.fromJson(json),
    );

    if (listPokemonData != null) {
      setState(() {
        pokemonList = listPokemonData.results;
        final List<String> stringList =
            pokemonList.map((jsonMap) => jsonEncode(jsonMap)).toList();
        prefs.setStringList('pokemonListData', stringList);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getListData().then((_) {
      if (mounted) {
        Timer(Duration(seconds: 2), () {
          _isLoading = false;
          Navigator.of(context).pushReplacementNamed('/pokedex_list');
        });
      }
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LandingPageView(
      isLoading: _isLoading,
      animation: _animation,
    );
  }
}
