import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'saki/anime_data.dart';
import 'saki/home_page.dart';
import 'saki/browse_anime_page.dart';
import 'profile_page.dart';
import 'saki/anime_detail.dart';

class AnimeReelsPage extends StatefulWidget {
  const AnimeReelsPage({super.key});

  @override
  State<AnimeReelsPage> createState() => _AnimeReelsPageState();
}

class _AnimeReelsPageState extends State<AnimeReelsPage> {
  final PageController _pageController = PageController();
  late VideoPlayerController _videoController;
  int selectedTopIcon = 0;
  int selectedBottomTab = 2; // RANDOM tab selected

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset("assets/videoplayback.mp4")
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
        _videoController.setLooping(true);
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = animeList;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // ---------------- HEADER ----------------
          Container(
            height: 90,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF0d1117),
                  const Color(0xFF0d1117).withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildTopIcon(1, Icons.search),
                    const SizedBox(width: 12),
                    _buildTopIcon(2, Icons.calendar_month),
                    const SizedBox(width: 12),
                    _buildTopIcon(3, Icons.notifications_outlined),
                    const SizedBox(width: 12),
                    _buildTopIcon(4, Icons.qr_code_scanner),
                    const SizedBox(width: 12),
                    // PROFILE BUTTON
                    GestureDetector(
                      onTap: () {
                        setState(() => selectedTopIcon = 5);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfilePage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedTopIcon == 5
                                ? Colors.yellow
                                : Colors.white.withOpacity(0.3),
                            width: 2,
                          ),
                          color: const Color(0xFFFFC107),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ---------------- REELS CONTENT ----------------
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final anime = items[index];
                return Stack(
                  children: [
                    // == Видео ==
                    SizedBox.expand(
                      child: _videoController.value.isInitialized
                          ? FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController.value.size.width,
                          height: _videoController.value.size.height,
                          child: VideoPlayer(_videoController),
                        ),
                      )
                          : const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                    // == Доод текст ==
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            anime.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${anime.episodes} анги",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // == Баруун доод булан - Анимийн зураг ==
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AnimeDetailPage(anime: anime),
                            ),
                          );
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: anime.imagePath.isNotEmpty
                                ? Image.asset(
                              anime.imagePath,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        anime.color.withOpacity(0.8),
                                        anime.color.withOpacity(0.4),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.movie,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                );
                              },
                            )
                                : Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    anime.color.withOpacity(0.8),
                                    anime.color.withOpacity(0.4),
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.movie,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // ---------------- FOOTER ----------------
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: const Color(0xFF0d1117),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(flex: 1, child: _buildBottomNavItem(0, Icons.home_outlined, "НҮҮР")),
                  Flexible(flex: 1, child: _buildBottomNavItem(1, Icons.play_circle_outline, "АНИМЕ")),
                  Flexible(flex: 1, child: _buildBottomNavItem(2, Icons.casino_outlined, "RANDOM")),
                  Flexible(flex: 1, child: _buildBottomNavItem(3, Icons.movie_outlined, "КИНО")),
                  Flexible(flex: 1, child: _buildBottomNavItem(4, Icons.theater_comedy_outlined, "ТЕАТР")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- TOP ICON ----------------
  Widget _buildTopIcon(int index, IconData icon) {
    bool isSelected = selectedTopIcon == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTopIcon = index),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? Colors.white.withOpacity(0.2)
              : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[600],
          size: 24,
        ),
      ),
    );
  }

  // ---------------- BOTTOM NAV ----------------
  Widget _buildBottomNavItem(int index, IconData icon, String label) {
    bool isSelected = selectedBottomTab == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedBottomTab = index);

        // RANDOM → Stay on this page
        if (label == "RANDOM") {
          return;
        }

        // АНИМЕ → MainScreen рүү буцах
        if (label == "АНИМЕ") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()),
          );
          return;
        }

        // Бусад таб — навигаци байхгүй (одоохондоо)
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.red : Colors.grey[600],
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? Colors.red : Colors.grey[600],
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}