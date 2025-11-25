import 'package:flutter/material.dart';
import 'package:untitled1/Namuundari/main.dart';
import 'package:untitled1/aaa.dart';
import 'anime_data.dart';
import 'browse_anime_page.dart';
import 'calendar_page.dart';
import 'anime_detail.dart';
import 'search_page.dart';
import 'package:untitled1/QR.dart';
import 'package:untitled1/Medegdel.dart';
import 'package:untitled1/profile_page.dart';
import 'package:untitled1/Random.dart';


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
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      userName = args['name'] ?? 'Хэрэглэгч';
      userEmail = args['email'] ?? '';
      userPhone = args['phone'] ?? '';
      userCategory = args['category'] ?? '';
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF0d1117),
                  const Color(0xFF0d1117).withValues(alpha: 0.8),
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
                    // Search Icon - Updated with navigation
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
                    const SizedBox(width: 12),
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

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildCategoryChip('Бүх аниме', true),
                        _buildCategoryChip('1080 HD', false),
                        _buildCategoryChip('NON', false),
                        _buildCategoryChip('Tv Tokyo', false),
                        _buildCategoryChip('Адал явдал', false),
                        _buildCategoryChip('Аймшиг', false),
                        _buildCategoryChip('Амьдралын хэв маяг', false),
                        _buildCategoryChip('Анимэйшн', false),
                        _buildCategoryChip('Арми', false),
                        _buildCategoryChip('Гэмт хэрэг', false),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Үргэлжлүүлэх'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Үргэлжлүүлэх').toList()),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Шинэ гаргалтууд'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Шинэ гаргалтууд').toList()),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Өөр ертөнцөд өрнөдөг'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Өөр ертөнцөд өрнөдөг').toList()),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Онцлох'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Онцлох').toList()),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Шинжлэх ухаан'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Шинжлэх ухаан').toList()),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Цэрэг, арми'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Цэрэг, арми').toList()),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Хайр дурлал, романс'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Хайр дурлал, романс').toList()),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Урт үргэлжилсэн'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Урт үргэлжилсэн').toList()),

                  const SizedBox(height: 24),
                  _buildSectionHeader('Спорт'),
                  const SizedBox(height: 12),
                  _buildAnimeRow(animeList.where((a) => a.category == 'Спорт').toList()),

                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),

          Container(
            height: 75,
            decoration: BoxDecoration(
              color: const Color(0xFF0d1117),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withValues(alpha: 0.1),
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
                  _buildBottomNavItem(2, Icons.play_circle_outline, "RANDOM"),
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

  Widget _buildTopIcon(int index, IconData icon) {
    return GestureDetector(
      onTap: () => setState(() => selectedTopIcon = index),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedTopIcon == index
              ? Colors.white.withValues(alpha: 0.2)
              : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: selectedTopIcon == index ? Colors.white : Colors.grey[600],
          size: 24,
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(int index, IconData icon, String label) {
    bool isSelected = selectedBottomTab == index;
    return GestureDetector(
      onTap: () {
        setState(() => selectedBottomTab = index);

        // Аниме товч → Anime MainScreen рүү буцах

        if (label == "НҮҮР") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const MyApp()),
          );
        }

        if (label == "АНИМЕ") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainScreen()),
          );
        }

        if (label == "RANDOM") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const AnimeReelsPage()),
          );
        }

        // Кино товч → MovieMainScreen рүү шилжих
        if (label == "КИНО") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const MyApp()),
          );
        }

        if (label == "ТЕАТР") {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (_) => const MyApp()),
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

  Widget _buildCategoryChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BrowseAnimePage(category: label),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : const Color(0xFF1a2744),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.red : Colors.white.withOpacity(0.2),
          ),
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
                  builder: (context) => BrowseAnimePage(category: title),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  'Цааш',
                  style: TextStyle(
                    color: Colors.orange[700],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.orange[700],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
                    color: Colors.white.withValues(alpha: 0.1),
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
                              anime.color.withValues(alpha: 0.6),
                              anime.color.withValues(alpha: 0.3),
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
                          anime.color.withValues(alpha: 0.6),
                          anime.color.withValues(alpha: 0.3),
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
}