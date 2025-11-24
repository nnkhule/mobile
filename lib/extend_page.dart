import 'package:flutter/material.dart';
import 'wallet_page.dart';

class ExtendPage extends StatelessWidget {
  const ExtendPage({super.key});

  @override
  Widget build(BuildContext context) {
    final packages = [
      {"title": "Премиум багц", "desc": "Бүх аниме, кино"},
      {"title": "Аниме багц", "desc": "Бүх аниме"},
      {"title": "Кино багц", "desc": "Бүх кино"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF171B22),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("ЭРХ СУНГАХ"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final pkg = packages[index];
          return Card(
            color: const Color(0xFF222730),
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            child: ListTile(
              title: Text(
                pkg["title"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                pkg["desc"]!,
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.white54,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WalletPage()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
