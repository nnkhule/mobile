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
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "ХЭТЭВЧ",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// TOP BOXES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _WalletBox(
                  title: "ANIMAX POINT",
                  value: "15000",
                  color: Color(0xFF1E2533),
                ),
                _WalletBox(
                  title: "WALLET",
                  value: "20000XP",
                  color: Color(0xFF1E2533),
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// OPTIONS LIST
            ...options.map((e) {
              return Card(
                color: const Color(0xFF1A202C),
                elevation: 0,
                child: ListTile(
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 12),

                  title: Text(
                    "${e["duration"]}",
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),

                  trailing: Text(
                    "${e["xp"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.redAccent,
                    ),
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SuccessPage(
                          message:
                          "${e["duration"]} багц амжилттай сунгагдлаа!",
                        ),
                      ),
                    );
                  },
                ),
              );
            })
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
    this.color = const Color(0xFF1E2533),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
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
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
