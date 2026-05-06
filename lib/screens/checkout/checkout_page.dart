import 'package:flutter/material.dart';
// PENTING: Sesuaikan import ini dengan lokasi file model Anda!
import '../../models/food_model.dart';

class CheckoutPage extends StatefulWidget {
  final Map<FoodModel, int> cart;

  const CheckoutPage({Key? key, required this.cart}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // State untuk menyimpan metode pembayaran yang dipilih (Default: COD)
  String _selectedPaymentMethod = 'Cash on Delivery (COD)';

  // Fungsi Kalkulasi Total Harga dengan Exception Handling
  int get _totalPrice {
    int total = 0;
    widget.cart.forEach((food, qty) {
      try {
        String cleanPrice = food.price.replaceAll(RegExp(r'[^0-9]'), '');
        int price = int.parse(cleanPrice);
        total += price * qty;
      } catch (e) {
        debugPrint("Error parsing harga untuk ${food.name}: $e");
      }
    });
    return total;
  }

  // Fungsi bantuan untuk membuat widget RadioListTile agar kode tidak terlalu panjang
  Widget _buildPaymentOption(String title, IconData icon) {
    return Column(
      children: [
        RadioListTile<String>(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          title: Row(
            children: [
              Icon(icon, color: Colors.amber, size: 24),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
          activeColor: Colors.amber,
          value: title,
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        const Divider(color: Colors.grey, height: 1, indent: 55, endIndent: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. DAFTAR PESANAN ---
              const Text(
                "Pesanan Anda",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.cart.length,
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.grey, height: 1),
                  itemBuilder: (context, index) {
                    final food = widget.cart.keys.elementAt(index);
                    final qty = widget.cart.values.elementAt(index);

                    return ListTile(
                      title: Text(
                        food.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        food.price,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: Text(
                        "x$qty",
                        style: const TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              // --- 2. METODE PEMBAYARAN (DIPERBARUI) ---
              const Text(
                "Metode Pembayaran",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    // Menggunakan fungsi bantuan _buildPaymentOption agar kode rapi
                    _buildPaymentOption("Cash on Delivery (COD)", Icons.money),
                    _buildPaymentOption("Transfer Bank", Icons.account_balance),
                    _buildPaymentOption(
                      "E-Wallet (OVO/GoPay/Dana)",
                      Icons.account_balance_wallet,
                    ),
                    _buildPaymentOption(
                      "QRIS (Scan Barcode)",
                      Icons.qr_code_scanner,
                    ),
                    _buildPaymentOption(
                      "Kartu Kredit / Debit",
                      Icons.credit_card,
                    ),
                    _buildPaymentOption(
                      "Minimarket (Alfamart/Indomaret)",
                      Icons.store,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // --- 3. RINGKASAN PEMBAYARAN ---
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Pembayaran:",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "Rp ${_totalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}",
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ), // Ruang kosong agar tidak tertutup tombol bawah
            ],
          ),
        ),
      ),

      // --- 4. TOMBOL KONFIRMASI PESANAN ---
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFF1E1E1E),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4AF37),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(color: Colors.amber),
                ),
              );

              try {
                await Future.delayed(const Duration(seconds: 2));

                if (!mounted) return;
                Navigator.pop(context);

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color(0xFF1E1E1E),
                    title: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 50,
                    ),
                    content: Text(
                      "Pesanan Berhasil!\n\nMetode: $_selectedPaymentMethod",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, height: 1.5),
                    ),
                    actions: [
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "OK",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } catch (e) {
                if (!mounted) return;
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Terjadi kesalahan: $e")),
                );
              }
            },
            child: const Text(
              "Konfirmasi Pesanan",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
