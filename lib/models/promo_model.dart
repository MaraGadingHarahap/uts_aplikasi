class PromoModel {
  final String title;
  final String image;
  final Function()? onTap; // Aksi saat promo diklik

  PromoModel({required this.title, required this.image, this.onTap});
}
