import 'package:flutter/material.dart';
import '../../../models/promo_model.dart'; // Pastikan path import benar

class PromoCarouselWidget extends StatelessWidget {
  const PromoCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Data promo menggunakan PromoModel
    final List<PromoModel> promos = [
      PromoModel(
        title: "Diskon 50%",
        image:
            'https://images.pexels.com/photos/11461699/pexels-photo-11461699.jpeg',
        onTap: () => print("Promo Diskon 50% diklik"),
      ),
      PromoModel(
        title: "Gratis Ongkir",
        image:
            'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=600&auto=format&fit=crop',
        onTap: () => print("Promo Gratis Ongkir diklik"),
      ),
      PromoModel(
        title: "Menu Baru: Sate",
        image:
            'https://images.pexels.com/photos/37106992/pexels-photo-37106992.jpeg',
        onTap: () => print("Promo Menu Baru diklik"),
      ),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: 160, // Sedikit lebih tinggi agar lebih proporsional
      child: PageView.builder(
        itemCount: promos.length,
        controller: PageController(
          viewportFraction: 0.9,
        ), // Agar kartu berikutnya sedikit terlihat
        itemBuilder: (context, index) {
          final promo = promos[index];
          return _buildPromoCard(promo);
        },
      ),
    );
  }

  Widget _buildPromoCard(PromoModel promo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip
            .antiAlias, // Memastikan gambar tidak keluar dari sudut membulat
        child: InkWell(
          onTap: promo.onTap,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(promo.image),
                fit: BoxFit.cover,
                // Memberikan lapisan gelap transparan agar teks terbaca
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Center(
              child: Text(
                promo.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
