import 'package:flutter/material.dart';
import '../../../models/category_model.dart'; // Pastikan path import sesuai

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan Class Model alih-alih Map
    final List<CategoryModel> categories = [
      CategoryModel(
        name: 'Makanan',
        image:
            'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=150&auto=format&fit=crop',
      ),
      CategoryModel(
        name: 'Minuman',
        image:
            'https://images.unsplash.com/photo-1544145945-f90425340c7e?q=80&w=150&auto=format&fit=crop',
      ),
      CategoryModel(
        name: 'Jajanan',
        image:
            'https://images.unsplash.com/photo-1559598467-f8b76c8105d0?q=80&w=150&auto=format&fit=crop',
      ),
      CategoryModel(
        name: 'Diskon',
        image:
            'https://images.unsplash.com/photo-1607083206869-4c7672e72415?q=80&w=150&auto=format&fit=crop',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories
            .map(
              (cat) => InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Membuka kategori ${cat.name}...')),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          cat.image, // Pemanggilan properti objek langsung menggunakan titik (.)
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.grey[200],
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                ),
                              ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(cat.name, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
