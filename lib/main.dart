import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokedex_page/pokedex_page.dart';
import 'package:pokedex/screens/landing_page/landing_page.dart';
import 'dart:io'; // Import for HttpClient
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex/screens/pokedex_list_page/pokedex_list_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  try {
    await dotenv.load(fileName: ".env"); // Load environment variables
    String appEnv = dotenv.env['APP_ENV'] ?? 'production';
    if (appEnv != 'PROD') {
      print("not production env override ssl certificate");
      HttpOverrides.global = MyHttpOverrides();
    }
  } catch (e) {
    throw Exception('Error loading .env file: $e'); // Print error if any
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => const LandingPage(),
        '/pokedex_list': (context) => const PokedexListPage(),
        '/pokedex': (context) => const PokedexPage(),
      },
    );
  }
}
