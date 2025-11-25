import 'package:flutter/material.dart';

class QrLensScreen extends StatelessWidget {
  const QrLensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120C12),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Spacer(),
                  const Text(
                    'QR КОД',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Red title
            const Text(
              'НЭВТРЭХ QR КОД',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 32),

            // Center lens area
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Square background
                    Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        color: const Color(0xFF252525),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    // Circular camera lens
                    Container(
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            spreadRadius: 2,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ],
                        gradient: RadialGradient(
                          colors: [
                            Colors.white.withOpacity(0.08),
                            Colors.black.withOpacity(0.9),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'QR scan',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Bottom text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
              child: Text(
                'Та веб сайтын нэвтрэх хэсэгт гарч ирэх QR\nкодыг уншуулж веб сайтдаа нэвтэрнэ үү',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
