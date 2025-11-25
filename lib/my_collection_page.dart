import 'package:flutter/material.dart';
import '/movie_detail_page_pro.dart';

class MyCollectionPage extends StatelessWidget {
  const MyCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> movies = [
      {"title": "Amelia's children", "imagePath": "assets/movie/Amelias children.jpg"},
      {"title": "Baghead", "imagePath": "assets/movie/Baghead.jpg"},
      {"title": "Bagman", "imagePath": "assets/movie/bagman.jpg"},
      {"title": "Concentration", "imagePath": "assets/movie/consentration.jpg"},
      {"title": "Dancing Village", "imagePath": "assets/movie/Dancing Village.jpg"},
      {"title": "Exhuma", "imagePath": "assets/movie/Exhuma.jpg"},
      {"title": "Imaginary", "imagePath": "assets/movie/Imaginary.jpg"},
      {"title": "Immaculate", "imagePath": "assets/movie/immaculate.jpg"},
      {"title": "Late night with the Devil", "imagePath": "assets/movie/Late night with the Devil.jpg"},
      {"title": "Long legs", "imagePath": "assets/movie/Long legs.jpg"},
      {"title": "Never Let Go", "imagePath": "assets/movie/Never Let Go.jpg"},
      {"title": "Nightmare", "imagePath": "assets/movie/nightmare.jpg"},
      {"title": "Operation Undead", "imagePath": "assets/movie/Operation Undead.jpg"},
      {"title": "Project Silence", "imagePath": "assets/movie/project silence.jpg"},
      {"title": "Spring garden", "imagePath": "assets/movie/Spring garden.jpg"},
      {"title": "Stopmotion", "imagePath": "assets/movie/Stopmotion.jpg"},
      {"title": "Strange Darling", "imagePath": "assets/movie/Strange Darling.jpg"},
      {"title": "Tarot", "imagePath": "assets/movie/Tarot.jpg"},
      {"title": "The Exorcism", "imagePath": "assets/movie/The exorcism.jpg"},
      {"title": "The Strangers", "imagePath": "assets/movie/The strangers.jpg"},
      {"title": "The Well", "imagePath": "assets/movie/The well.jpg"},
      {"title": "Train to Busan", "imagePath": "assets/movie/Train to Busan.jpg"},
      {"title": "Wake Up", "imagePath": "assets/movie/Wake up.jpg"},
      {"title": "Winnie the Pooh", "imagePath": "assets/movie/winnie the pooh.jpg"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF171B22),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white70, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Миний сан",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // Гол хэсэг
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.58,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MovieDetailPage(
                                  title: movie["title"]!,
                                  image: movie["imagePath"]!,
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              movie["imagePath"]!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        movie["title"]!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          Container(
            color: const Color(0xFF0F1319),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "© 2025 Horror Collection",
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                Icon(Icons.favorite, color: Colors.redAccent, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
