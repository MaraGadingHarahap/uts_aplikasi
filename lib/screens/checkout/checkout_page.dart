import 'package:flutter/material.dart';
import '../../models/food_model.dart';
import 'success_page.dart';

class CheckoutPage extends StatefulWidget {
  final Map<FoodModel, int> cart;
  const CheckoutPage({super.key, required this.cart});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _selectedMethod = "Gopay";

  // Daftar Metode Pembayaran Luas
  final List<Map<String, dynamic>> _paymentMethods = [
    {
      "name": "Gopay",
      "icon": Icons.account_balance_wallet,
      "color": Colors.blue,
    },
    {"name": "OVO", "icon": Icons.wallet, "color": Colors.purple},
    {
      "name": "Dana",
      "icon": Icons.account_balance_wallet_rounded,
      "color": Colors.blueAccent,
    },
    {
      "name": "Transfer Bank (BCA/Mandiri)",
      "icon": Icons.account_balance,
      "color": Colors.orange,
    },
    {"name": "Virtual Account", "icon": Icons.vpn_key, "color": Colors.teal},
    {
      "name": "Kartu Kredit/Debit",
      "icon": Icons.credit_card,
      "color": Colors.red,
    },
  ];

  int get _total {
    int total = 0;
    widget.cart.forEach(
      (f, q) =>
          total += int.parse(f.price.replaceAll(RegExp(r'[^0-9]'), '')) * q,
    );
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Pembayaran"),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                  "Ringkasan Pesanan",
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ...widget.cart.entries
                    .map(
                      (e) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(e.key.name),
                        trailing: Text(
                          "${e.value}x",
                          style: const TextStyle(color: Color(0xFFD4AF37)),
                        ),
                      ),
                    )
                    .toList(),
                const Divider(color: Colors.grey, height: 40),
                const Text(
                  "Pilih Metode Pembayaran",
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                // Loop untuk semua metode pembayaran
                ..._paymentMethods
                    .map(
                      (method) => Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _selectedMethod == method['name']
                                ? const Color(0xFFD4AF37)
                                : Colors.transparent,
                          ),
                        ),
                        child: RadioListTile<String>(
                          value: method['name'],
                          groupValue: _selectedMethod,
                          onChanged: (val) =>
                              setState(() => _selectedMethod = val!),
                          activeColor: const Color(0xFFD4AF37),
                          title: Text(
                            method['name'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          secondary: Icon(
                            method['icon'],
                            color: method['color'],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          // Bar Bawah
          Container(
            padding: const EdgeInsets.all(20),
            color: const Color(0xFF1E1E1E),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Bayar", style: TextStyle(fontSize: 16)),
                    Text(
                      "Rp $_total",
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xFFD4AF37),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessPage(),
                    ),
                  ),
                  child: Text("Bayar dengan $_selectedMethod"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
