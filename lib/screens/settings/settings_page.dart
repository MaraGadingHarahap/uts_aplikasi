import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("Profile Settings"),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF8E0E00),
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text(
              "Hafizh Abi Tama",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4AF37),
              ),
            ),
          ),
          const Center(
            child: Text("Premium Member", style: TextStyle(color: Colors.grey)),
          ),
          const SizedBox(height: 40),

          _buildSettingsItem(Icons.person_outline, "Edit Profile"),
          _buildSettingsItem(Icons.history, "Order History"),
          _buildSettingsItem(Icons.payment, "Payment Methods"),
          _buildSettingsItem(Icons.notifications_none, "Push Notifications"),

          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: Colors.amber,
            ), // Sesuaikan warna kuningnya
            title: const Text(
              "About App",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {
              // 2. Aksi memunculkan pop-up dialog saat diklik
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: const Color(
                      0xFF1E1E1E,
                    ), // Background gelap senada dengan tema aplikasi
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: const Row(
                      children: [
                        Icon(Icons.info, color: Colors.amber),
                        SizedBox(width: 10),
                        Text(
                          "Tentang Aplikasi",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    content: const Text(
                      "Luxury Dining App v1.0.0\n\n"
                      "Aplikasi pemesanan makanan eksklusif ini dirancang dan dikembangkan untuk memenuhi tugas proyek mata kuliah.\n\n"
                      "Developer:\nHafizh Abi Tama",
                      style: TextStyle(color: Colors.white70, height: 1.5),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Menutup dialog
                        },
                        child: const Text(
                          "Tutup",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Divider(color: Colors.grey, height: 40),

          ListTile(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ),
            leading: const Icon(Icons.logout, color: Color(0xFF8E0E00)),
            title: const Text(
              "Logout",
              style: TextStyle(
                color: Color(0xFF8E0E00),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFD4AF37)),
      title: Text(title, style: const TextStyle(color: Color(0xFFE0E0E0))),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
}
