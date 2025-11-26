import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'anime_data.dart';
import 'package:untitled1/Namuundari/movie_player_screen.dart';

class AnimeDetailPage extends StatefulWidget {
  final AnimeItem anime;

  const AnimeDetailPage({super.key, required this.anime});

  @override
  State<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  bool isFavorite = false;

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
          widget.anime.title,
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
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isFavorite ? "Дуртайд нэмэгдлээ ❤️" : "Дуртайгаас хасагдлаа"),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CustomPaint(
                      painter: HeartPainter(isFilled: isFavorite),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => MoviePlayerScreen(
                title: widget.anime.title,
                episodes: List.generate(
                widget.anime.episodes,
                (index) => "${index + 1}-р анги",
                ),
                ),
                ),
                );
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                child: const Text(
                "ҮЗЭХ",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
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
            widget.anime.imagePath.isNotEmpty
                ? Image.asset(
              widget.anime.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        widget.anime.color.withOpacity(0.6),
                        widget.anime.color.withOpacity(0.3),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.movie,
                      size: 80,
                      color: Colors.white54,
                    ),
                  ),
                );
              },
            )
                : Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.anime.color.withOpacity(0.6),
                    widget.anime.color.withOpacity(0.3),
                  ],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.movie,
                  size: 80,
                  color: Colors.white54,
                ),
              ),
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
                    widget.anime.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellowAccent, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        '${widget.anime.rating}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const Spacer(),
                      const Icon(Icons.calendar_today, color: Colors.white54, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        widget.anime.year,
                        style: const TextStyle(color: Colors.white54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _TagChip(widget.anime.category),
                      const SizedBox(width: 8),
                      _TagChip('${widget.anime.episodes} анги'),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.anime.description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Ангиуд хэсэг
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "АНГИУД",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),

            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: widget.anime.episodes > 10 ? 10 : widget.anime.episodes,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF222730),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.anime.color.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white.withOpacity(0.7),
                          size: 32,
                        ),
                      ),
                    ),
                    title: Text(
                      '${index + 1}-р анги',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      '23 минут',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                    trailing: Icon(
                      Icons.download_outlined,
                      color: Colors.grey[600],
                    ),
                    onTap: () {
                      // Play episode
                    },
                  ),
                );
              },
            ),

            if (widget.anime.episodes > 10)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      // Show all episodes
                    },
                    child: Text(
                      'Бүх ${widget.anime.episodes} ангийг харах',
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    widget.anime.imagePath.isNotEmpty
                        ? Image.asset(
                      widget.anime.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[800],
                          child: const Center(
                            child: Icon(
                              Icons.movie,
                              size: 60,
                              color: Colors.white54,
                            ),
                          ),
                        );
                      },
                    )
                        : Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[800],
                      child: const Center(
                        child: Icon(
                          Icons.movie,
                          size: 60,
                          color: Colors.white54,
                        ),
                      ),
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

            // Төстэй анимэнүүд
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "ТӨСТЭЙ АНИМЭНҮҮД",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: animeList
                    .where((a) =>
                a.category == widget.anime.category &&
                    a.title != widget.anime.title)
                    .length,
                itemBuilder: (context, index) {
                  final similarAnime = animeList
                      .where((a) =>
                  a.category == widget.anime.category &&
                      a.title != widget.anime.title)
                      .toList();

                  if (index >= similarAnime.length) return const SizedBox();

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimeDetailPage(
                            anime: similarAnime[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.1),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: similarAnime[index].imagePath.isNotEmpty
                                    ? Image.asset(
                                  similarAnime[index].imagePath,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            similarAnime[index].color.withOpacity(0.6),
                                            similarAnime[index].color.withOpacity(0.3),
                                          ],
                                        ),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.movie,
                                          size: 40,
                                          color: Colors.white54,
                                        ),
                                      ),
                                    );
                                  },
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        similarAnime[index].color.withOpacity(0.6),
                                        similarAnime[index].color.withOpacity(0.3),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.movie,
                                      size: 40,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            similarAnime[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
  final bool isFilled;

  HeartPainter({this.isFilled = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isFilled ? Colors.redAccent : Colors.white
      ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 2;

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

    if (isFilled) {
      canvas.drawShadow(path, Colors.black45, 2, true);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant HeartPainter oldDelegate) {
    return oldDelegate.isFilled != isFilled;
  }
}