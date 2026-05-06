import 'package:flutter/material.dart';
import '../../models/restaurant_model.dart';
import '../../models/food_model.dart';
import '../checkout/checkout_page.dart';

class RestaurantDetailPage extends StatefulWidget {
  final RestaurantModel restaurant;
  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
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
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(0xFF1E1E1E),
            flexibleSpace: FlexibleSpaceBar(
              // PERBAIKAN: Menggunakan widget.restaurant.image
              background: Image.asset(
                widget.restaurant.image, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[900], child: const Icon(Icons.broken_image, color: Colors.amber)),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final food = widget.restaurant.menu[index];
              final qty = _cart[food] ?? 0;

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      // PERBAIKAN: Menggunakan food.image dari list menu
                      child: Image.asset(food.image, width: 70, height: 70, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(food.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          Text(food.price, style: const TextStyle(color: Color(0xFFD4AF37))),
                        ],
                      ),
                    ),
                    qty == 0 
                      ? IconButton(onPressed: () => _updateCart(food, 1), icon: const Icon(Icons.add_circle_outline, color: Color(0xFFD4AF37)))
                      : Row(
                          children: [
                            IconButton(onPressed: () => _updateCart(food, -1), icon: const Icon(Icons.remove_circle_outline, color: Colors.grey)),
                            Text("$qty", style: const TextStyle(color: Colors.white)),
                            IconButton(onPressed: () => _updateCart(food, 1), icon: const Icon(Icons.add_circle, color: Color(0xFFD4AF37))),
                          ],
                        ),
                  ],
                ),
              );
            }, childCount: widget.restaurant.menu.length),
          ),
        ],
      ),
      bottomNavigationBar: _cart.isNotEmpty 
          ? Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFF1E1E1E),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), minimumSize: const Size(double.infinity, 55)),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage(cart: _cart))),
                child: Text("Checkout (${_cart.length} Menu) - Rp $_totalPrice", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ) 
          : null,
    );
  }
}