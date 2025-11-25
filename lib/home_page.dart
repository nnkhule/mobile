import 'package:flutter/material.dart';
import 'anime_data.dart';
import '../browse_anime_page.dart';
import 'package:untitled1/profile_page.dart';
import '../aaa.dart';
import 'package:untitled1/main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTopIcon = 0;
  int selectedBottomTab = 1;

  String userName = 'Хэрэглэгч';
  String userEmail = '';
  String userPhone = '';
  String userCategory = '';

  @override
  Widget build(BuildContext context) {
    // Аргумент ирсэн бол уншина
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      userName = args['name'] ?? 'Хэрэглэгч';
      userEmail = args['email'] ?? '';
      userPhone = args['phone'] ?? '';
      userCategory = args['category'] ?? '';
    }

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
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

                    // PROFILE BUTTON (→ ProfilePage)
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
                        _buildCategoryChip("Бүх аниме", true),
                        _buildCategoryChip("1080 HD", false),
                        _buildCategoryChip("NON", false),
                        _buildCategoryChip("Tv Tokyo", false),
                        _buildCategoryChip("Адал явдал", false),
                        _buildCategoryChip("Аймшиг", false),
                        _buildCategoryChip("Амьдралын хэв маяг", false),
                        _buildCategoryChip("Анимэйшн", false),
                        _buildCategoryChip("Арми", false),
                        _buildCategoryChip("Гэмт хэрэг", false),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  _buildSection("Үргэлжлүүлэх"),
                  _buildSection("Шинэ гаргалтууд"),
                  _buildSection("Өөр ертөнцөд өрнөдөг"),
                  _buildSection("Онцлох"),
                  _buildSection("Шинжлэх ухаан"),
                  _buildSection("Цэрэг, арми"),
                  _buildSection("Хайр дурлал, романс"),
                  _buildSection("Урт үргэлжилсэн"),
                  _buildSection("Спорт"),

                  const SizedBox(height: 90),
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
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
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
        ],
      ),
    );
  }

  // ---------------- SECTION BUILDER ----------------
  Widget _buildSection(String title) {
    return Column(
      children: [
        _buildSectionHeader(title),
        const SizedBox(height: 12),
        _buildAnimeRow(
          animeList.where((a) => a.category == title).toList(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  // ---------------- SECTION HEADER ----------------
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BrowseAnimePage(category: title),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  "Цааш",
                  style: TextStyle(
                    color: Colors.orange[700],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios,
                    size: 12, color: Colors.orange[700]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- ANIME ROW ----------------
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

  // ---------------- ANIME CARD ----------------
  Widget _buildAnimeCard(AnimeItem anime) {
    bool showEpisodeNumber =
        anime.category == "Үргэлжлүүлэх" ||
            anime.category == "Шинэ гаргалтууд";

    return Container(

      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: anime.imagePath.isNotEmpty
                  ? Image.asset(
                anime.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
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
                    child: Icon(Icons.play_circle_outline,
                        size: 40, color: Colors.white70)),
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
            ),
          ),
          if (showEpisodeNumber)
            Text(
              "${anime.episodes}-р анги",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 11,
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

        // Кино товч → MovieMainScreen рүү шилжих
        if (label == "КИНО") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const MovieMainScreen()),
          );
          // Аниме товч → Anime MainScreen рүү буцах
          if (label == "АНИМЕ") {
            Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (_) => const MainScreen()),
            );
          }


        }
      },      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: isSelected ? Colors.red : Colors.grey[600],
          ),
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

  // ---------------- CATEGORY CHIP ----------------
  Widget _buildCategoryChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BrowseAnimePage(
              category: label,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : const Color(0xFF1a2744),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: isSelected
                  ? Colors.red
                  : Colors.white.withOpacity(0.2)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[400],
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
