import 'package:flutter/material.dart';
import 'movie_player_screen.dart';

class MovieDetailPage extends StatelessWidget {
  final String title;
  final String image;

  const MovieDetailPage({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171B22),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Дуртайд нэмэгдлээ ❤️"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CustomPaint(
                      painter: HeartPainter(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // ҮЗЭХ button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MoviePlayerScreen(
                          title: "$title - 1-р анги",
                          episodes: const [
                            "1-р анги",
                            "2-р анги",
                            "3-р анги",
                            "4-р анги",
                            "5-р анги",
                            "6-р анги",
                            "7-р анги",
                            "8-р анги",
                            "9-р анги",
                            "10-р анги",
                          ],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    "ҮЗЭХ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),

            // Дэлгэрэнгүй хэсэг
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF222730),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.yellowAccent, size: 18),
                      SizedBox(width: 6),
                      Text("N/A", style: TextStyle(color: Colors.white70)),
                      Spacer(),
                      Icon(Icons.calendar_today,
                          color: Colors.white54, size: 16),
                      SizedBox(width: 4),
                      Text("2021", style: TextStyle(color: Colors.white54)),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: const [
                      _TagChip("Адал явдалт"),
                      SizedBox(width: 8),
                      _TagChip("Тулаант"),
                      SizedBox(width: 8),
                      _TagChip("Тулалт"),
                    ],
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Ayanami Rei нь Японы алдарт Neon Genesis Evangelion анимэд гардаг гол дүрүүдийн нэг юм. "
                    "Тэрээр NERV байгууллагийн 'EVA Unit-00' хэмээх аварга биет роботыг жолоодон Angel-уудтай тулалдаж "
                    "эхний туршилтын нисгэгч буюу 'First Child' юм.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Трейлер хэсэг
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "ТРАЙЛЭР",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          color: Colors.white.withOpacity(0.9),
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}


class _TagChip extends StatelessWidget {
  final String label;
  const _TagChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}


class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.fill;

    final path = Path();

    double width = size.width;
    double height = size.height;

    path.moveTo(width / 2, height * 0.8);

    // Баруун талын муруй
    path.cubicTo(
      width * 1.2, height * 0.45,
      width * 0.8, height * 0.05,
      width / 2, height * 0.3,
    );

    // Зүүн талын муруй
    path.cubicTo(
      width * 0.2, height * 0.05,
      -width * 0.2, height * 0.45,
      width / 2, height * 0.8,
    );

    canvas.drawShadow(path, Colors.black45, 2, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
