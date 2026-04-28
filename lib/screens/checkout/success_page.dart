import 'package:aplikasi_pemesanan/screens/home/home_view.dart';
import 'package:flutter/material.dart';
import '../../main_screen.dart'; // Untuk kembali ke beranda

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 120),
            const SizedBox(height: 24),
            const Text(
              "Pembayaran Berhasil!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Pesanan sedang disiapkan oleh restoran.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              onPressed: () {
                // Gunakan pushAndRemoveUntil untuk membersihkan semua tumpukan (stack)
                // Ini akan mencegah navigasi ganda (double navigation bar)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                  (route) =>
                      false, // Menghapus semua halaman sebelumnya dari memori
                );
              },
              child: const Text("Kembali ke Beranda"),
            ),
          ],
        ),
      ),
    );
  }
}
