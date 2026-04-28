import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Luxury Food App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212), // Hitam Charcoal
        primaryColor: const Color(0xFF8E0E00), // Merah Burgundy
        cardColor: const Color(0xFF1E1E1E), // Abu-abu Gelap untuk Card
        // Pengaturan teks bawaan Flutter, diatur ke warna terang agar terbaca
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFE0E0E0)),
          bodyMedium: TextStyle(color: Color(0xFFE0E0E0)),
          titleLarge: TextStyle(
            color: Color(0xFFE0E0E0),
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(color: Color(0xFFE0E0E0)),
        ),

        // Pengaturan Tombol
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8E0E00), // Tombol Merah Burgundy
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        // Pengaturan Navigasi Bawah
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1E1E1E),
          selectedItemColor: Color(0xFFD4AF37), // Ikon Emas saat dipilih
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
