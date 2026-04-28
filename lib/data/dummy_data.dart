import '../models/restaurant_model.dart';
import '../models/food_model.dart';

final List<RestaurantModel> allRestaurants = [
  // 1. Pizza House
  RestaurantModel(
    name: "Pizza House",
    image: "assets/images/rst.jpg",
    distance: "1.2 km",
    rating: 4.8,
    menu: [
      FoodModel(
        name: "Pizza Meat Lover",
        price: "Rp 35.000",
        image: "assets/images/meatl.jpg",
      ),
      FoodModel(
        name: "Pizza Neapolitan",
        price: "Rp 28.000",
        image: "assets/images/neapolitan.jpg",
      ),
      FoodModel(
        name: "Pizza Margherita",
        price: "Rp 32.000",
        image: "assets/images/mrgh.jpg",
      ),
      FoodModel(
        name: "Pizza Buffalo",
        price: "Rp 30.000",
        image: "assets/images/bfl.jpg",
      ),
      FoodModel(
        name: "Sicilian Pizza",
        price: "Rp 25.000",
        image: "assets/images/scl.jpg",
      ),
      FoodModel(
        name: "Pizza California",
        price: "Rp 20.000",
        image: "assets/images/clf.jpg",
      ),
    ],
  ),

  // 2. Mie Aceh Bang Jal
  RestaurantModel(
    name: "Mie Aceh Bang Jal",
    image: "assets/images/wrkp.jpg",
    distance: "3.1 km",
    rating: 4.9,
    menu: [
      FoodModel(
        name: "Mie Aceh Daging",
        price: "Rp 30.000",
        image: "assets/images/acehdaging.jpg",
      ),
      FoodModel(
        name: "Mie Aceh Udang",
        price: "Rp 35.000",
        image: "assets/images/ach.jpg",
      ),
      FoodModel(
        name: "Martabak Aceh",
        price: "Rp 25.000",
        image: "assets/images/mbk.jpg",
      ),
      FoodModel(
        name: "Kopi Dingin",
        price: "Rp 17.000",
        image: "assets/images/kops.jpg",
      ),
      FoodModel(
        name: "Teh Susu Telur",
        price: "Rp 15.000",
        image: "assets/images/tehtelur.jpg",
      ),
      FoodModel(
        name: "Sanger Dingin",
        price: "Rp 15.000",
        image: "assets/images/kopser.jpg",
      ),
    ],
  ),

  // 3. Soto Medan Sinar Pagi
  RestaurantModel(
    name: "Soto Medan Sinar Pagi",
    image: "assets/images/sot.jpg",
    distance: "2.5 km",
    rating: 4.7,
    menu: [
      FoodModel(
        name: "Soto Daging Sapi",
        price: "Rp 35.000",
        image: "assets/images/sott.jpg",
      ),
      FoodModel(
        name: "Soto Paru Goreng",
        price: "Rp 35.000",
        image: "assets/images/sotoparu.jpg",
      ),
      FoodModel(
        name: "Es Jeruk",
        price: "Rp 15.000",
        image: "assets/images/esjeruk.jpg",
      ),
      FoodModel(
        name: "Es Timun",
        price: "Rp 18.000",
        image: "assets/images/estmun.jpg",
      ),
      FoodModel(
        name: "Soto Iga",
        price: "Rp 40.000",
        image: "assets/images/iga.jpg",
      ),
      FoodModel(
        name: "Soto Rawon",
        price: "Rp 26.000",
        image: "assets/images/rwon.jpg",
      ),
    ],
  ),

  // 4. Mie Balap Medan (Perbaikan Path Kosong)
  RestaurantModel(
    name: "Mie Balap Medan",
    image:
        "assets/images/blpp.jpg", // Menggunakan salah satu gambar menu sebagai cover
    distance: "0.8 km",
    rating: 4.6,
    menu: [
      FoodModel(
        name: "Mie Balap Seafood Telur",
        price: "Rp 25.000",
        image: "assets/images/miebalapseafoodtelur.jpg",
      ),
      FoodModel(
        name: "Es Teh Manis",
        price: "Rp 7.000",
        image: "assets/images/thmnis.jpg",
      ),
      FoodModel(
        name: "Bihun Seafood",
        price: "Rp 22.000",
        image: "assets/images/bihun.jpg",
      ),
      FoodModel(
        name: "Risol Goreng",
        price: "Rp 5.000",
        image: "assets/images/risol.jpg",
      ),
      FoodModel(
        name: "Bakwan Goreng",
        price: "Rp 5.000",
        image: "assets/images/bakwan.jpg",
      ),
      FoodModel(
        name: "Mie Balap Seafood Daging",
        price: "Rp 25.000",
        image: "assets/images/sfdgoreng.jpg",
      ),
      FoodModel(
        name: "Jus Jeruk",
        price: "Rp 15.000",
        image: "assets/images/jukjerus.jpg",
      ),
    ],
  ),

  // 5. Luxury Steak House (Perbaikan Path Kosong)
  RestaurantModel(
    name: "Luxury Steak House",
    image: "assets/images/stk.jpg", // Menggunakan gambar wagyu sebagai cover
    distance: "4.5 km",
    rating: 4.9,
    menu: [
      FoodModel(
        name: "Wagyu A5 Sirloin",
        price: "Rp 1.200.000",
        image: "assets/images/wagyua5sirloin.jpg",
      ),
      FoodModel(
        name: "Black Angus Ribeye",
        price: "Rp 450.000",
        image: "assets/images/blackangusribeye.jpg",
      ),
      FoodModel(
        name: "Truffle Fries",
        price: "Rp 95.000",
        image: "assets/images/trufflefries.jpg",
      ),
      FoodModel(
        name: "Chicken Grill",
        price: "Rp 45.000",
        image: "assets/images/aym.jpg",
      ),
      FoodModel(
        name: "Mac And Cheese",
        price: "Rp 60.000",
        image: "assets/images/mac.jpg",
      ),
      FoodModel(
        name: "Blue Ocean",
        price: "Rp 55.000",
        image: "assets/images/ocean.jpg",
      ),
      FoodModel(
        name: "Milkshake Strawberry",
        price: "Rp 35.000",
        image: "assets/images/stroberishake.jpg",
      ),
    ],
  ),

  // 6. Nelayan Jala Jala Dimsum
  RestaurantModel(
    name: "Nelayan Jala Jala Dimsum",
    image: "assets/images/jala.jpg",
    distance: "2.1 km",
    rating: 4.8,
    menu: [
      FoodModel(
        name: "Siomay Udang Premium",
        price: "Rp 32.000",
        image: "assets/images/somayudang.jpg",
      ),
      FoodModel(
        name: "Hakau Nelayan",
        price: "Rp 35.000",
        image: "assets/images/hakau.jpg",
      ),
      FoodModel(
        name: "Teh Bunga Chrysanthemum",
        price: "Rp 25.000",
        image: "assets/images/tehbunga.jpg",
      ),
      FoodModel(
        name: "Nasi Goreng Seafood",
        price: "Rp 45.000",
        image: "assets/images/sfd.jpg",
      ),
      FoodModel(
        name: "Teh Olong",
        price: "Rp 25.000",
        image: "assets/images/olong.jpg",
      ),
      FoodModel(
        name: "Mantao",
        price: "Rp 30.000",
        image: "assets/images/mantao.jpg",
      ),
    ],
  ),

  // 7. Bolu Meranti & Bakery
  RestaurantModel(
    name: "Bolu Meranti & Bakery",
    image: "assets/images/bika.jpg",
    distance: "5.2 km",
    rating: 4.8,
    menu: [
      FoodModel(
        name: "Bolu Gulung Keju Standar",
        price: "Rp 85.000",
        image: "assets/images/bolukeju.jpg",
      ),
      FoodModel(
        name: "Cheese Cake",
        price: "Rp 45.000",
        image: "assets/images/keju.jpg",
      ),
      FoodModel(
        name: "Lapis Legit",
        price: "Rp 35.000",
        image: "assets/images/lapis.jpg",
      ),
      FoodModel(
        name: "Brownies Coklat",
        price: "Rp 38.000",
        image: "assets/images/brownies.jpg",
      ),
      FoodModel(
        name: "Bolu Pandan",
        price: "Rp 85.000",
        image: "assets/images/pandan.jpg",
      ),
      FoodModel(
        name: "Bolu Red Velvet",
        price: "Rp 85.000",
        image: "assets/images/redvelvet.jpg",
      ),
    ],
  ),

  // 8. Ayam Penyet Jakarta
  RestaurantModel(
    name: "Ayam Penyet Jakarta",
    image: "assets/images/jakarte.jpg",
    distance: "1.5 km",
    rating: 4.5,
    menu: [
      FoodModel(
        name: "Ayam Penyet Cabe Ijo",
        price: "Rp 25.000",
        image: "assets/images/ijoayam.jpg",
      ),
      FoodModel(
        name: "Lele Krispi",
        price: "Rp 22.000",
        image: "assets/images/krispile.jpg",
      ),
      FoodModel(
        name: "Ayam Geprek",
        price: "Rp 15.000",
        image: "assets/images/ayamgeprek.jpg",
      ),
      FoodModel(
        name: "Es Lemon",
        price: "Rp 15.000",
        image: "assets/images/lemon.jpg",
      ),
      FoodModel(
        name: "Es Kelapa Jeruk",
        price: "Rp 17.000",
        image: "assets/images/kelapajeruk.jpg",
      ),
      FoodModel(
        name: "Bebek Geprek",
        price: "Rp 26.000",
        image: "assets/images/bebek.jpg",
      ),
    ],
  ),

  // 9. Martabak Yurich Medan
  RestaurantModel(
    name: "Martabak Yurich Medan",
    image: "assets/images/bosmbk.jpg",
    distance: "2.8 km",
    rating: 4.7,
    menu: [
      FoodModel(
        name: "Martabak Manis Keju",
        price: "Rp 65.000",
        image: "assets/images/mbkkeju.jpg",
      ),
      FoodModel(
        name: "Martabak Telur Bebek",
        price: "Rp 75.000",
        image: "assets/images/mbktelo.jpg",
      ),
      FoodModel(
        name: "Martabak Krepes ",
        price: "Rp 15.000",
        image: "assets/images/krepes.jpg",
      ),
      FoodModel(
        name: "Martabak Stroberry",
        price: "Rp 50.000",
        image: "assets/images/stroberi.jpg",
      ),
      FoodModel(
        name: "Martabak Coklat",
        price: "Rp 48.000",
        image: "assets/images/coklat.jpg",
      ),
    ],
  ),

  // 10. Burger & Grill Luxury
  RestaurantModel(
    name: "Burger & Grill Luxury",
    image: "assets/images/brgr.jpg",
    distance: "6.0 km",
    rating: 4.4,
    menu: [
      FoodModel(
        name: "Double Wagyu Burger",
        price: "Rp 85.000",
        image: "assets/images/brwgyu.jpg",
      ),
      FoodModel(
        name: "Classic Cheese Burger",
        price: "Rp 65.000",
        image: "assets/images/brche.jpg",
      ),
      FoodModel(
        name: "Vanilla Milkshake Luxury",
        price: "Rp 45.000",
        image: "assets/images/vnmilk.jpg",
      ),
      FoodModel(
        name: "Chicken Burger",
        price: "Rp 30.000",
        image: "assets/images/burgerayam.jpg",
      ),
      FoodModel(
        name: "Cheese Burger",
        price: "Rp 28.000",
        image: "assets/images/burgerkeju.jpg",
      ),
      FoodModel(
        name: "Manggo Float",
        price: "Rp 22.000",
        image: "assets/images/manggafloat.jpg",
      ),
    ],
  ),
];
