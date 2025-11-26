import 'package:flutter/material.dart';
import 'package:untitled1/Dorjsambuu/anime_data.dart';
import 'package:untitled1/Dorjsambuu/anime_detail.dart';
import 'package:untitled1/Namuundari/Film.dart';
import 'package:untitled1/Namuundari/movie_detail_page.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/Dorjsambuu/home_page.dart';
import 'package:untitled1/Dorjsambuu/calendar_page.dart';
import 'package:untitled1/Dorjsambuu/search_page.dart';
import 'package:untitled1/Namuundari/QR.dart';
import 'package:untitled1/Namuundari/Medegdel.dart';
import 'package:untitled1/profile_page.dart';
import 'package:untitled1/Random.dart';
import 'package:untitled1/Namuundari/kino_nuur.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int selectedTopIcon = 0;
  int selectedBottomTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ============ HEADER ============
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
                    // Search
                    GestureDetector(
                      onTap: () {
                        setState(() => selectedTopIcon = 1);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedTopIcon == 1
                              ? Colors.white.withOpacity(0.2)
                              : Colors.transparent,
                        ),
                        child: Icon(
                          Icons.search,
                          color: selectedTopIcon == 1 ? Colors.white : Colors.grey[600],
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Calendar
                    GestureDetector(
                      onTap: () {
                        setState(() => selectedTopIcon = 2);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CalendarPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedTopIcon == 2
                              ? Colors.white.withOpacity(0.2)
                              : Colors.transparent,
                        ),
                        child: Icon(
                          Icons.calendar_month,
                          color: selectedTopIcon == 2 ? Colors.white : Colors.grey[600],
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Notifications
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.grey,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // QR Scanner
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QrLensScreen(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.grey,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Profile
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

          // ============ MAIN CONTENT ============
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // ============ ANIME SECTION ============
                  _buildMainSectionHeader('АНИМЕ'),
                  const SizedBox(height: 16),

                  // Anime: Үргэлжлүүлэх
                  _buildSubSectionHeader('Үргэлжлүүлэх'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Үргэлжлүүлэх').toList()),
                  const SizedBox(height: 24),

                  // Anime: Өөр ертөнцөд өрнөдөг
                  _buildSubSectionHeader('Өөр ертөнцөд өрнөдөг'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Өөр ертөнцөд өрнөдөг').toList()),
                  const SizedBox(height: 24),

                  // Anime: Онцлох
                  _buildSubSectionHeader('Онцлох'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Онцлох').toList()),
                  const SizedBox(height: 32),

                  // ============ MOVIE SECTION ============
                  _buildMainSectionHeader('КИНО'),
                  const SizedBox(height: 16),

                  // Movie: Адал явдалт
                  _buildSubSectionHeader('Адал явдалт'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Адал явдалт').toList()),
                  const SizedBox(height: 24),

                  // Movie: Аймшгийн
                  _buildSubSectionHeader('Аймшгийн'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Аймшгийн').toList()),
                  const SizedBox(height: 24),

                  // Movie: Нууцлаг
                  _buildSubSectionHeader('Нууцлаг'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Нууцлаг').toList()),

                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),

          // ============ FOOTER ============
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavItem(0, Icons.home_outlined, "НҮҮР"),
                  _buildBottomNavItem(1, Icons.play_circle_outline, "АНИМЕ"),
                  _buildBottomNavItem(2, Icons.casino_outlined, "RANDOM"),
                  _buildBottomNavItem(3, Icons.movie_outlined, "КИНО"),
                  _buildBottomNavItem(4, Icons.theater_comedy_outlined, "ТЕАТР"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============ MAIN SECTION HEADER ============
  Widget _buildMainSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
          letterSpacing: 1,
        ),
      ),
    );
  }

  // ============ SUB SECTION HEADER ============
  Widget _buildSubSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  // ============ ANIME ROW ============
  Widget _buildAnimeRow(List<AnimeItem> items) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildAnimeCard(items[index]);
        },
      ),
    );
  }

  // ============ ANIME CARD ============
  Widget _buildAnimeCard(AnimeItem anime) {
    bool showEpisodeNumber = anime.category == 'Үргэлжлүүлэх' ||
        anime.category == 'Шинэ гаргалтууд';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimeDetailPage(anime: anime),
          ),
        );
      },
      child: Container(
        width: 120,
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
                  child: anime.imagePath.isNotEmpty
                      ? Image.asset(
                    anime.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              anime.color.withOpacity(0.6),
                              anime.color.withOpacity(0.3),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
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
                          anime.color.withOpacity(0.6),
                          anime.color.withOpacity(0.3),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_outline,
                        size: 40,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              anime.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            if (showEpisodeNumber) const SizedBox(height: 4),
            if (showEpisodeNumber)
              Text(
                '${anime.episodes}-р анги',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 11,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ============ MOVIE ROW ============
  Widget _buildMovieRow(List<MovieItem> items) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildMovieCard(items[index]);
        },
      ),
    );
  }

  // ============ MOVIE CARD ============
  Widget _buildMovieCard(MovieItem movie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailPage(
              title: movie.title,
              image: movie.imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: movie.imagePath.isNotEmpty
                    ? Image.asset(
                  movie.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
                    : Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.movie,
                    size: 40,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============ BOTTOM NAV ============
  Widget _buildBottomNavItem(int index, IconData icon, String label) {
    bool isSelected = selectedBottomTab == index;
    return GestureDetector(
      onTap: () {
        setState(() => selectedBottomTab = index);

        // Navigation handled by home_page.dart and Namuundari/main.dart
        // This is the unified home, so НҮҮР stays here
        if (label == "НҮҮР") {
          // Already on home
        }

        if (label == "АНИМЕ") {
          // Navigate to full anime page (home_page.dart MainScreen)
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()),
          );
        }

        if (label == "RANDOM") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const AnimeReelsPage()),
          );
        }

        if (label == "КИНО") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const MyApp()),
          );
        }

        if (label == "ТЕАТР") {
          // Stay on home for now
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: isSelected ? Colors.red : Colors.grey[600],
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