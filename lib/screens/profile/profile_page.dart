import 'package:aplikasi_pemesanan/screens/settings/settings_page.dart';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.edit_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header Profil
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              "Hafizh Abi Tama",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "hafizh.abitama@email.com",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Statistik Singkat
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn("Pesanan", "12"),
                _buildStatColumn("Voucher", "5"),
                _buildStatColumn("Poin", "1.250"),
              ],
            ),
            const Divider(height: 40, thickness: 1, indent: 20, endIndent: 20),

            // Daftar Menu Pengaturan
            _buildProfileMenu(
              Icons.shopping_bag_outlined,
              "Riwayat Pesanan",
              () {},
            ),
            _buildProfileMenu(
              Icons.location_on_outlined,
              "Alamat Tersimpan",
              () {},
            ),
            _buildProfileMenu(
              Icons.payment_outlined,
              "Metode Pembayaran",
              () {},
            ),
            _buildProfileMenu(
              Icons.notifications_none_outlined,
              "Notifikasi",
              () {},
            ),
            _buildProfileMenu(Icons.security_outlined, "Keamanan Akun", () {}),
            _buildProfileMenu(Icons.help_outline, "Pusat Bantuan", () {}),
            // Di dalam _buildProfileMenu pada ProfilePage
            _buildProfileMenu(Icons.settings_outlined, "Pengaturan", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            }),

            const SizedBox(height: 20),
            // Tombol Keluar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Kembali ke halaman Login dan hapus semua riwayat navigasi
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text(
                  "Keluar Akun",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildProfileMenu(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
