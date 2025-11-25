import 'package:flutter/material.dart';
import 'Film.dart';

// Category screens
import 'AdalYvdalScreen.dart';
import 'AimshgiinScreen.dart';
import 'BiAijiinaScreen.dart';
import 'AnimationScreen.dart';
import 'DramaScreen.dart';
import 'GemtHeregScreen.dart';
import 'GerBulScreen.dart';
import 'MagicScreen.dart';
import 'MusicalScreen.dart';
import 'MysteryScreen.dart';
import 'ZergeldeeWorldScreen.dart';
import 'IneedemScreen.dart';
import 'UranZognoltScreen.dart';
import 'package:untitled1/saki/calendar_page.dart';
import 'package:untitled1/saki/search_page.dart';
// Detail + Profile
import 'movie_detail_page.dart';
import '../profile_page.dart';
import '../saki/home_page.dart';import 'package:untitled1/QR.dart';
import 'package:untitled1/Medegdel.dart';
import 'package:untitled1/Random.dart';
// -----------------------
// ENTRY POINT
// -----------------------
void main() => runApp(const MyApp());

// -----------------------
// MAIN APP
// -----------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playmax Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0d1117),
      ),
      home: const MovieMainScreen(),
    );
  }
}

// -----------------------
// HOME SCREEN
// -----------------------
class MovieMainScreen extends StatefulWidget {
  const MovieMainScreen({super.key});

  @override
  State<MovieMainScreen> createState() => _MovieMainScreenState();
}

class _MovieMainScreenState extends State<MovieMainScreen> {
  int selectedTopIcon = 0;
  int selectedBottomTab = 3;

  void toggleLike(int index) {
    setState(() {
      movieList[index].isLiked = !movieList[index].isLiked;
    });
  }

  void updateRating(int index, int stars) {
    setState(() {
      movieList[index].rating = stars.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              ? Colors.white.withValues(alpha: 0.2)
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
                              ? Colors.white.withValues(alpha: 0.2)
                              : Colors.transparent,
                        ),
                        child: Icon(
                          Icons.calendar_month,
                          color: selectedTopIcon == 2 ? Colors.white : Colors.grey[600],
                          size: 24,
                        ),
                      ),
                    ),
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
                    //  FIXED QR ICON (NO HIGHLIGHT, ONLY NAVIGATION)
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
                        color: Colors.grey, // stays grey!
                        size: 26,
                      ),
                    ),

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
                        child: const Icon(Icons.person,
                            color: Colors.black, size: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ---------------- MAIN CONTENT ----------------
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // CATEGORY CHIPS
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildCategoryChip("Бүх кино", true),

                        _chipNav("Адал явдалт", const AdalYvdalScreen()),
                        _chipNav("Аймшгийн", const AimshgiinScreen()),
                        _chipNav("Би айжийна", const BiAijiinascreen()),
                        _chipNav("Багачуудад", const AnimationScreen()),
                        _chipNav("Гэмт хэрэг", const Gemtheregscreen()),
                        _chipNav("Гэр бүл", const GerBulscreen()),
                        _chipNav("Драма", const Dramascreen()),
                        _chipNav("Зэргэлдээ ертөнц",
                            const ZergeldeeWorldscreen()),
                        _chipNav("Ид шид", const MagicScreen()),
                        _chipNav("Инээдэм", const IneedemScreen()),
                        _chipNav("Мюзикл", const MusicalScreen()),
                        _chipNav("Нууцлаг", MysteryScreen()),
                        _chipNav("Уран зөгнөлт", const Uranzognoltscreen()),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ---------------- SECTIONS ----------------
                  _section("Үргэлжлүүлэх", "Үргэлжлүүлэх"),
                  _section("ШИНЭ ГАРАЛТУУД", "Шинэ гаргалтууд"),
                  _section("АДАЛ ЯВДАЛТ", "Адал явдалт"),
                  _section("ИНЭЭДЭМ", "Инээдэм"),
                  _section("МЮЗИКЛ", "Мюзикл"),
                  _section("ДУРСАМЖ СЭРГЭМ", "Дурсамж сэргэм"),
                  _section("ХАЙР ДУРЛАЛ", "Хайр дурлал"),
                  _section("БАГАЧУУДАД", "Багачуудад"),
                  _section("ГЭР БҮЛ", "Гэр бүл"),
                  _section("ДРАМА", "Драма"),
                  _section("БИ АЙЖИЙНА", "Би айжийна"),
                  _section("Уран зөгнөлт", "Уран зөгнөлт"),
                  _section("АЙМШГИЙН", "Аймшгийн"),
                  _section("ГЭМТ ХЭРЭГ", "Гэмт хэрэг"),
                  _section("НУУЦЛАГ", "Нууцлаг"),
                ],
              ),
            ),
          ),

          // ---------------- FOOTER ----------------
          Container(
            height: 75,
            decoration: BoxDecoration(
              color: const Color(0xFF0d1117),
              border: Border(
                top: BorderSide(
                    color: Colors.white.withOpacity(0.1), width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem(0, Icons.home_outlined, "НҮҮР"),
                _buildBottomNavItem(1, Icons.play_circle_outline, "АНИМЕ"),
                _buildBottomNavItem(2, Icons.thunderstorm_outlined, "RANDOM"),
                _buildBottomNavItem(3, Icons.movie_outlined, "КИНО"),
                _buildBottomNavItem(4, Icons.theater_comedy_outlined, "ТЕАТР"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 SECTION BUILDER
  Widget _section(String title, String cat) {
    return Column(
      children: [
        _buildSectionHeader(title),
        const SizedBox(height: 12),
        _buildMovieRow(movieList.where((m) => m.category == cat).toList()),
        const SizedBox(height: 24),
      ],
    );
  }

  // 🔹 SECTION HEADER
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );
  }

  // 🔹 MOVIE ROW
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

  // 🔹 MOVIE CARD
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
            // IMAGE
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
                  child: const Icon(Icons.movie,
                      size: 40, color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // TITLE
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

  // 🔹 TOP ICON
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
        child: Icon(icon,
            color: isSelected ? Colors.white : Colors.grey[600], size: 24),
      ),
    );
  }

  // 🔹 BOTTOM NAV
  Widget _buildBottomNavItem(int index, IconData icon, String label) {
    bool isSelected = selectedBottomTab == index;
    return GestureDetector(
      onTap: () {
        setState(() => selectedBottomTab = index);

        // Аниме товч → Anime MainScreen рүү буцах
        if (label == "АНИМЕ") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()),
          );
        }

        if (label == "RAN DOM") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const AnimeReelsPage()),
          );
        }

        // Кино товч → MovieMainScreen рүү шилжих
        if (label == "КИНО") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const MovieMainScreen()),
          );
        }
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size: 28,
              color: isSelected ? Colors.red : Colors.grey[600]),
          const SizedBox(height: 4),
          Text(label,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.red : Colors.grey[600],
                fontWeight:
                isSelected ? FontWeight.bold : FontWeight.normal,
              )),
        ],
      ),
    );
  }

  // 🔹 CATEGORY CHIP
  Widget _buildCategoryChip(String label, bool isSelected,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : const Color(0xFF1a2744),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: isSelected ? Colors.red : Colors.white.withOpacity(0.2)),
        ),
        child: Text(label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[400],
              fontSize: 13,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }

  // 🔹 QUICK CHIP JUMP
  Widget _chipNav(String label, Widget screen) {
    return _buildCategoryChip(
      label,
      false,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen),
      ),
    );
  }
}
