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
