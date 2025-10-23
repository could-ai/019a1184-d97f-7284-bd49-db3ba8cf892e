import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home_screen.dart';
import 'screens/food_list_screen.dart';

void main() {
  runApp(const NutriGuiaApp());
}

class NutriGuiaApp extends StatelessWidget {
  const NutriGuiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriGuia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4CAF50), // Verde nutrição
        colorScheme: const ColorScheme(
          primary: Color(0xFF4CAF50), // Verde nutrição
          secondary: Color(0xFFFF9800), // Laranja energia
          surface: Color(0xFFF4F6F8), // Fundo cinza claro
          background: Color(0xFFF4F6F8),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Color(0xFF333333), // Cinza escuro
          onBackground: Color(0xFF333333),
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.interTextTheme().copyWith(
          headlineLarge: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
          headlineMedium: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
          headlineSmall: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
          bodyLarge: GoogleFonts.inter(
            color: const Color(0xFF333333),
          ),
          bodyMedium: GoogleFonts.inter(
            color: const Color(0xFF333333),
          ),
          bodySmall: GoogleFonts.inter(
            color: const Color(0xFF333333),
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/protein': (context) => FoodListScreen(category: 'Proteínas'),
        '/fiber': (context) => FoodListScreen(category: 'Fibras'),
        '/carbs': (context) => FoodListScreen(category: 'Carboidratos'),
        '/fats': (context) => FoodListScreen(category: 'Gorduras Boas'),
      },
    );
  }
}
