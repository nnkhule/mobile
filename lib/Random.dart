import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:untitled1/Namuundari/kino_nuur.dart'; // Movie Main
import 'Dorjsambuu/home_page.dart'; // Anime Main
import 'profile_page.dart';
import 'Dorjsambuu/anime_data.dart';
import 'Dorjsambuu/anime_detail.dart';
import 'Dorjsambuu/browse_anime_page.dart';
import 'Dorjsambuu/search_page.dart';
import 'Dorjsambuu/calendar_page.dart';
import 'Namuundari/Medegdel.dart';
import 'Namuundari/QR.dart';
import 'main_home_page.dart';

class AnimeReelsPage extends StatefulWidget {
  const AnimeReelsPage({super.key});

  @override
  State<AnimeReelsPage> createState() => _AnimeReelsPageState();
}

class _AnimeReelsPageState extends State<AnimeReelsPage> {
  final PageController _pageController = PageController();
  late VideoPlayerController _videoController;

  int selectedTopIcon = 0;
  int selectedBottomTab = 2; // RANDOM selected

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
          _buildHeader(),

          Expanded(
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final anime = items[index];
                return Stack(
                  children: [
                    // VIDEO
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
                        child: CircularProgressIndicator(
                            color: Colors.white),
                      ),
                    ),

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
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${anime.episodes} анги",
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 14),
                          ),
                        ],
                      ),
                    ),

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
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 8,
                                  spreadRadius: 2)
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              anime.imagePath,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Icon(
                                Icons.broken_image,
                                color: Colors.white,
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

          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
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
              // Search
              _topIcon(
                index: 1,
                icon: Icons.search,
                page: const SearchPage(),
              ),
              const SizedBox(width: 12),

              // Calendar
              _topIcon(
                index: 2,
                icon: Icons.calendar_month,
                page: const CalendarPage(),
              ),
              const SizedBox(width: 12),

              // Notification
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const NotificationScreen())),
                child: const Icon(Icons.notifications_outlined,
                    color: Colors.grey, size: 26),
              ),
              const SizedBox(width: 12),

              // QR
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const QrLensScreen())),
                child: const Icon(Icons.qr_code_scanner,
                    color: Colors.grey, size: 26),
              ),
              const SizedBox(width: 12),

              // Profile
              GestureDetector(
                onTap: () {
                  setState(() => selectedTopIcon = 5);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ProfilePage()));
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC107),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedTopIcon == 5
                          ? Colors.yellow
                          : Colors.white.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: const Icon(Icons.person,
                      color: Colors.black, size: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topIcon({required int index, required IconData icon, required Widget page}) {
    bool isSelected = selectedTopIcon == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedTopIcon = index);
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor:
        isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
        child: Icon(icon, color: isSelected ? Colors.white : Colors.grey),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xFF0d1117),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNav(0, Icons.home_outlined, "НҮҮР"),
          _bottomNav(1, Icons.play_circle_outline, "АНИМЕ"),
          _bottomNav(2, Icons.casino_outlined, "RANDOM"),
          _bottomNav(3, Icons.movie_outlined, "КИНО"),
          _bottomNav(4, Icons.theater_comedy_outlined, "ТЕАТР"),
        ],
      ),
    );
  }

  Widget _bottomNav(int index, IconData icon, String label) {
    bool isSelected = selectedBottomTab == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedBottomTab = index);

        if (label == "НҮҮР") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MainHomePage()),
          );
        }

        if (label == "АНИМЕ") {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const MainScreen()));
        }

        if (label == "RANDOM") {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const AnimeReelsPage()));
        }

        if (label == "КИНО") {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const MyApp()));
        }

        if (label == "ТЕАТР") {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const MyApp()));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              color: isSelected ? Colors.red : Colors.grey, size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? Colors.red : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
