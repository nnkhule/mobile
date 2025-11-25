import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../../movie_player_screen.dart';
=======
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567

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
<<<<<<< HEAD
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
=======

>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
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
<<<<<<< HEAD

                // ----------------------
                // ҮЗЭХ button
                // ----------------------
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MoviePlayerScreen(
                          title: "$title - 1-р анги",
                          episodes: [
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
=======
                ElevatedButton(
                  onPressed: () {
                    // “ҮЗЭХ” товчны дараах үйлдэл
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
<<<<<<< HEAD
                      horizontal: 12,
                      vertical: 8,
                    ),
=======
                        horizontal: 12, vertical: 8),
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
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
<<<<<<< HEAD
=======

        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
      ),

      // ----------------------------------------
      // БИЕИЙН ХЭСЭГ
      // ----------------------------------------
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
<<<<<<< HEAD

=======
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
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
<<<<<<< HEAD
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),

=======
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.yellowAccent, size: 18),
                      SizedBox(width: 6),
                      Text("N/A", style: TextStyle(color: Colors.white70)),
                      Spacer(),
                      Icon(Icons.calendar_today,
                          color: Colors.white54, size: 16),
                      SizedBox(width: 4),
<<<<<<< HEAD
                      Text("2021",
                          style: TextStyle(color: Colors.white54)),
                    ],
                  ),

=======
                      Text("2021", style: TextStyle(color: Colors.white54)),
                    ],
                  ),
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      _TagChip("Адал явдалт"),
                      SizedBox(width: 8),
<<<<<<< HEAD
                      _TagChip("Тулаант"),
=======
                      _TagChip("Тулалт"),
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
                    ],
                  ),
                ],
              ),
            ),
<<<<<<< HEAD

=======
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Ayanami Rei нь Японы алдарт Neon Genesis Evangelion анимэд гардаг гол дүрүүдийн нэг юм. "
                    "Тэрээр NERV байгууллагийн 'EVA Unit-00' хэмээх аварга биет роботыг жолоодон Angel-уудтай тулалдаж "
                    "эхний туршилтын нисгэгч буюу 'First Child' юм.",
<<<<<<< HEAD
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

=======
                style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
              ),
            ),
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
            const SizedBox(height: 20),
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
<<<<<<< HEAD

=======
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
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
<<<<<<< HEAD

=======
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ---------------------------
<<<<<<< HEAD
// TAG CHIP
=======
// TAG CHIP COMPONENT
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
// ---------------------------
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

// ---------------------------
<<<<<<< HEAD
// ❤️ HEART PAINTER
=======
// ❤️ HEART PAINTER (зурагдсан зүрх)
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
// ---------------------------
class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.fill;

    final path = Path();

<<<<<<< HEAD
=======
    // Зүрхний хэлбэрийг тодорхойлж байна
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
    double width = size.width;
    double height = size.height;

    path.moveTo(width / 2, height * 0.8);

<<<<<<< HEAD
=======
    // Баруун талын муруй
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
    path.cubicTo(
      width * 1.2, height * 0.45,
      width * 0.8, height * 0.05,
      width / 2, height * 0.3,
    );

<<<<<<< HEAD
=======
    // Зүүн талын муруй
>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
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
<<<<<<< HEAD
=======


>>>>>>> 3a8b897be94c171bff67380dd0948476bd225567
