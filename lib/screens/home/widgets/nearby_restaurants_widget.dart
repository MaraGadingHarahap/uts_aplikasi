import 'package:aplikasi_pemesanan/screens/detail/restaurant_detail_page.dart';
import 'package:flutter/material.dart';
import '../../../data/dummy_data.dart'; // Import database palsu kita

class NearbyRestaurantsWidget extends StatelessWidget {
  final String searchQuery;

  const NearbyRestaurantsWidget({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    // Membaca data dari dummy_data.dart dan memfilternya
    final filtered = allRestaurants
        .where((r) => r.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            searchQuery.isEmpty ? "Restoran Terdekat" : "Hasil Pencarian",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final res = filtered[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      res.image, // res.image isinya harus 'assets/images/pizza.webp'
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    res.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${res.distance} | ⭐ ${res.rating}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RestaurantDetailPage(restaurant: res),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
