import 'package:flutter/material.dart';
import '../../../models/food_model.dart';
import '../../detail/food_detail_page.dart';

class RecommendationsWidget extends StatelessWidget {
  const RecommendationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list menggunakan FoodModel
    final List<FoodModel> recommendations = [
      FoodModel(
        name: 'Ayam Penyet Spesial',
        image:
            'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?q=80&w=300&auto=format&fit=crop',
        price: 'Rp 25.000',
      ),
      FoodModel(
        name: 'Nasi Goreng Gila',
        image:
            'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?q=80&w=300&auto=format&fit=crop',
        price: 'Rp 20.000',
      ),
      FoodModel(
        name: 'Sate Ayam Madura',
        image:
            'https://images.unsplash.com/photo-1643886653895-1daf2001c258?q=80&w=1631&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        price: 'Rp 22.000',
      ),
      FoodModel(
        name: 'Mie Goreng Seafood',
        image:
            'https://images.unsplash.com/photo-1585032226651-759b368d7246?q=80&w=300&auto=format&fit=crop',
        price: 'Rp 28.000',
      ),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Rekomendasi Buat Kamu",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("Lihat Semua", style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              final food = recommendations[index]; // Mengambil objek FoodModel

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // BAGIAN YANG DIPERBAIKI: Kirim objek 'food' secara utuh
                      builder: (context) => FoodDetailPage(food: food),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(right: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.network(
                            food.image,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: 100,
                                  color: Colors.grey,
                                  child: const Icon(
                                    Icons.broken_image,
                                    color: Colors.white,
                                  ),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                food.price,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
