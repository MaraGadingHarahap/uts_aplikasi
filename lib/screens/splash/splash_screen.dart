import 'package:flutter/material.dart';
import '../login/login_screen.dart'; // Pastikan path ini sesuai dengan project Anda

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Durasi splash screen 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Background Charcoal
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ikon Utama berwarna Emas
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFD4AF37), width: 2),
              ),
              child: const Icon(
                Icons.restaurant_menu,
                size: 80,
                color: Color(0xFFD4AF37), // Secondary Gold
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "LUXURY DINING",
              style: TextStyle(
                color: Color(0xFFD4AF37),
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Elegance in Every Bite",
              style: TextStyle(
                color: Color(0xFFE0E0E0), // Light Grey
                fontSize: 14,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 50),
            // Loading indicator berwarna Burgundy
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8E0E00)),
            ),
          ],
        ),
      ),
    );
  }
}
