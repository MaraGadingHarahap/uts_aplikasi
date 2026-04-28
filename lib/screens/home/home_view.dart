import 'package:flutter/material.dart';
import 'widgets/header_widget.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/promo_carousel_widget.dart';
import 'widgets/categories_widget.dart';
import 'widgets/recommendations_widget.dart';
import 'widgets/nearby_restaurants_widget.dart';
import '../settings/settings_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0; // Untuk mengontrol navigasi bawah
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // Jika indeks bukan 0 (Beranda), kita tampilkan halaman lain di dalam Scaffold yang sama
    Widget currentBody;
    if (_currentIndex == 1) {
      currentBody = const Center(
        child: Text(
          "Histori Pembelian Masih Kosong",
          style: TextStyle(color: Colors.white),
        ),
      );
    } else if (_currentIndex == 2) {
      currentBody = const SettingsPage(); // Langsung tampilkan SettingsPage
    } else {
      currentBody = _buildHomeContent(); // Konten Beranda utama
    }

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(child: currentBody),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1E1E),
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFFD4AF37),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Histori"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }

  // Fungsi untuk memisahkan konten beranda agar kode tidak menumpuk
  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(
              () => _currentIndex = 2,
            ), // Klik header pindah ke tab profil
            child: const HeaderWidget(),
          ),
          SearchBarWidget(
            onChanged: (value) => setState(() => _searchQuery = value),
          ),
          if (_searchQuery.isEmpty) ...[
            const PromoCarouselWidget(),
            const CategoriesWidget(),
            const RecommendationsWidget(),
          ],
          NearbyRestaurantsWidget(searchQuery: _searchQuery),
        ],
      ),
    );
  }
}
