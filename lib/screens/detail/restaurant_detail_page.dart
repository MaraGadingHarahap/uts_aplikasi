import 'package:flutter/material.dart';
// PENTING: Sesuaikan 3 baris import di bawah ini dengan nama folder di project Anda!
import '../../models/restaurant_model.dart';
import '../../models/food_model.dart';
import '../checkout/checkout_page.dart'; // Sesuaikan path menuju file CheckoutPage

class RestaurantDetailPage extends StatefulWidget {
  final RestaurantModel restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
    : super(key: key);

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  // Map untuk menyimpan pesanan di keranjang
  final Map<FoodModel, int> _cart = {};

  // Fungsi untuk menambah/mengurangi pesanan
  void _updateCart(FoodModel food, int change) {
    setState(() {
      if (_cart.containsKey(food)) {
        _cart[food] = _cart[food]! + change;
        if (_cart[food]! <= 0) {
          _cart.remove(food);
        }
      } else {
        if (change > 0) {
          _cart[food] = change;
        }
      }
    });
  }

  // Menghitung total item di keranjang
  int get _totalItems {
    int total = 0;
    _cart.forEach((key, value) {
      total += value;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Tema gelap aplikasi
      body: CustomScrollView(
        slivers: [
          // --- 1. BAGIAN HEADER GAMBAR RESTORAN ---
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: const Color(0xFF1E1E1E),
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.restaurant.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                ),
              ),
              background: Image.asset(
                widget.restaurant.image,
                fit: BoxFit.cover,
                // Exception handling jika gambar gagal dimuat
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[900],
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.amber,
                        size: 50,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // --- 2. BAGIAN DAFTAR MENU ---
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final food = widget.restaurant.menu[index];
              final qty = _cart[food] ?? 0;

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    // PERBAIKAN: Gambar Menu Rapi (Tidak Overflow)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 80, // Lebar tetap
                        height: 80, // Tinggi tetap
                        child: Image.asset(
                          food.image,
                          fit: BoxFit.cover, // Memaksa gambar pas di kotak
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.black26,
                                child: const Icon(
                                  Icons.fastfood,
                                  color: Colors.grey,
                                ),
                              ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    // Expanded agar teks tidak menabrak batas layar
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            food.price,
                            style: const TextStyle(
                              color: Color(0xFFD4AF37), // Warna emas/kuning
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Bagian Tombol Counter (Tambah/Kurang)
                    qty == 0
                        ? IconButton(
                            onPressed: () => _updateCart(food, 1),
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Color(0xFFD4AF37),
                              size: 30,
                            ),
                          )
                        : Row(
                            children: [
                              IconButton(
                                onPressed: () => _updateCart(food, -1),
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "$qty",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () => _updateCart(food, 1),
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Color(0xFFD4AF37),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              );
            }, childCount: widget.restaurant.menu.length),
          ),

          // Memberi jarak kosong di bawah agar list tidak tertutup tombol checkout
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),

      // --- 3. BAGIAN TOMBOL CHECKOUT (Dengan Async & Exception Handling) ---
      bottomSheet: _cart.isNotEmpty
          ? Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF1E1E1E),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37), // Warna Emas
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // Penerapan Async dan Try-Catch
                onPressed: () async {
                  try {
                    // Simulasi loading asinkron (misal: menyiapkan data)
                    await Future.delayed(const Duration(milliseconds: 300));

                    if (!mounted)
                      return; // Mencegah error jika layar sudah ditutup

                    // Navigasi ke halaman Checkout
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(cart: _cart),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Gagal memproses pesanan: $e")),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_bag, color: Colors.black),
                    const SizedBox(width: 10),
                    Text(
                      "Checkout ($_totalItems item)",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null, // Sembunyikan tombol jika keranjang kosong
    );
  }
}
