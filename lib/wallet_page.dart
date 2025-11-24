import 'package:flutter/material.dart';
import 'success_page.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      {"duration": "1 сар", "xp": "10000XP"},
      {"duration": "3 сар", "xp": "20000XP"},
      {"duration": "6 сар", "xp": "50000XP"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("ХЭТЭВЧ"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [

                _WalletBox(title: "ANIMAX POINT", value: "15000", color: Color(0xFF222730)),
                _WalletBox(title: "WALLET", value: "20000XP", color: Color(0xFF222730)),

              ],
            ),
            const SizedBox(height: 24),
            ...options.map((e) {
              return Card(
                color: const Color(0xFF222730),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text("${e["duration"]}"),
                  trailing: Text("${e["xp"]}",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SuccessPage()));
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _WalletBox extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _WalletBox({
    required this.title,
    required this.value,
    this.color = const Color(0xFF322626),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 70,
      decoration: BoxDecoration(
        color: color, // 👈 энд өнгө ашиглагдана
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

