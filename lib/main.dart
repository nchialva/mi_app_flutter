import 'package:flutter/material.dart';
import 'package:pet_pal_dyary/providers/pet_moment_provider.dart';
import 'package:pet_pal_dyary/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
// ¡Importa la nueva pantalla de bienvenida!

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PetMomentProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Moments',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WelcomeScreen(), // ¡Ahora la app inicia con WelcomeScreen!
    );
  }
}
