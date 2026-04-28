import 'package:flutter/material.dart';
import '../../../models/restaurant_model.dart';
import '../../../models/food_model.dart';
import '../checkout/checkout_page.dart';

class RestaurantDetailPage extends StatefulWidget {
  final RestaurantModel restaurant;
  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  // FITUR UTAMA: Map untuk menyimpan berbagai jenis makanan yang berbeda
  final Map<FoodModel, int> _cart = {};

  void _updateCart(FoodModel food, int change) {
    setState(() {
      if (_cart.containsKey(food)) {
        _cart[food] = _cart[food]! + change;
        if (_cart[food]! <= 0) _cart.remove(food);
      } else if (change > 0) {
        _cart[food] = change;
      }
    });
  }

  // Menghitung total harga semua jenis makanan di keranjang
  int get _totalPrice {
    int total = 0;
    _cart.forEach((food, qty) {
      int price = int.parse(food.price.replaceAll(RegExp(r'[^0-9]'), ''));
      total += price * qty;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          // Di dalam class RestaurantDetailPage...
          // Pastikan variabel restaurant yang dipanggil adalah objek yang dikirim dari Home
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              // PERBAIKAN: Pastikan menggunakan Image.asset dan variabel yang tepat
              background: Image.asset(
                widget
                    .restaurant
                    .image, // Pastikan memanggil variabel 'image' dari model restoran
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Ini untuk berjaga-jaga jika gambar gagal muat
                  return Container(
                    color: Colors.grey[900],
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.white,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final food = widget.restaurant.menu[index];
              final qty = _cart[food] ?? 0;

              // Di dalam SliverChildBuilderDelegate
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    // --- PERBAIKAN START: Container Gambar yang Seragam ---
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 100, // Tentukan lebar tetap
                        height: 100, // Tentukan tinggi tetap agar semua sama
                        child: Image.asset(
                          food.image,
                          fit: BoxFit
                              .cover, // Ini penting agar gambar memenuhi kotak tanpa merusak aspek rasio
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

                    // --- PERBAIKAN END ---
                    const SizedBox(width: 15),

                    // Gunakan Expanded agar teks tidak mendorong layar ke kanan
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
                            maxLines: 2, // Mencegah teks terlalu panjang
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            food.price,
                            style: const TextStyle(
                              color: Color(0xFFD4AF37),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Bagian Tombol Tambah (Counter)
                    // Ganti _buildQuantitySelector(food) dengan ini:
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
                          ), // Panggil fungsi counter Anda di sini
                  ],
                ),
              );
            }, childCount: widget.restaurant.menu.length),
          ),
        ],
      ),
      // BAR KERANJANG (Akan muncul jika ada minimal satu makanan yang dipilih)
      bottomNavigationBar: _cart.isNotEmpty
          ? Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFF1E1E1E),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CheckoutPage(cart: _cart), // MENGIRIM SELURUH KERANJANG
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${_cart.length} Menu Terpilih"),
                    Text("Total: Rp $_totalPrice"),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
