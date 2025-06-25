import 'package:flutter/material.dart';
import 'landing_page_view.dart';
import 'package:provider/provider.dart';
import 'package:new_pokedex/features/landing/presentation/view_model/landing_provider.dart';
import 'package:go_router/go_router.dart';

class LandingPageState extends StatefulWidget {
  const LandingPageState({super.key});

  @override
  State<LandingPageState> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPageState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LandingProvider>().fetchPokemonList().whenComplete(() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            context.replace('/pokedex');
          }
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<LandingProvider>().isLoading;
    return LandingPageView(
      isLoading: isLoading,
      animation: _animation,
    );
  }
}
