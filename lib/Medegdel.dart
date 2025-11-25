import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120C12),
      appBar: AppBar(
        backgroundColor: const Color(0xFF120C12),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "МЭДЭГДЭЛ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildNotificationTile(
            context,
            title: "Эрх сунгах",
            date: "2025-11-20",
            message: "Таны данс амжилттай цэнэглэгдлээ.",
          ),
          const SizedBox(height: 12),

          buildNotificationTile(
            context,
            title: "Эрх сунгах",
            date: "2025-09-20",
            message: "Таны үйлчилгээний эрх сунгагдлаа.",
          ),
          const SizedBox(height: 12),

          buildNotificationTile(
            context,
            title: "Эрх сунгах",
            date: "2025-08-20",
            message: "Таны эрх дуусах дөхөж байна.",
          ),
        ],
      ),
    );
  }

  Widget buildNotificationTile(
      BuildContext context, {
        required String title,
        required String date,
        required String message,
      }) {
    return GestureDetector(

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E2E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(Icons.access_time, color: Colors.amber[300], size: 20),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 4),
                Text(date,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
