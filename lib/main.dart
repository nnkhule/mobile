import 'package:flutter/material.dart';
import '../../Film.dart'; // кинонуудын мэдээллийг эндээс unshina
import 'AdalYvdalScreen.dart';
import 'AimshgiinScreen.dart';
import 'BiAijiinaScreen.dart';
import 'AnimationScreen.dart';
import '../../DramaScreen.dart';
import 'GemtHeregScreen.dart';
import 'GerBulScreen.dart';
import '../../MagicScreen.dart';
import '../../MusicalScreen.dart';
import '../../MysteryScreen.dart';
import '.././ZergeldeeWorldScreen.dart';
import 'IneedemScreen.dart';
import '../../UranZognoltScreen.dart';
import '../../movie_detail_page.dart';
import 'profile_page.dart';

void main() => runApp(const MovieApp());

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});
import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

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
          // Header
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
                    GestureDetector(
                      onTap: () { setState(() => selectedTopIcon = 5);
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfilePage()),
                        );},
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

          // Main content
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
                        _buildCategoryChip('Бүх кино', true),
                        _buildCategoryChip(
                          'Адал явдалт',
                          false,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AdalYvdalScreen()),
                            );
                          },
                        ),
                        _buildCategoryChip(
                            'Аймшгийн',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AimshgiinScreen()),
                              );

                            }),
                        _buildCategoryChip(
                            'Би айжийна',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const BiAijiinascreen())
                              );
                            }),
                        _buildCategoryChip(
                            'Багачуудад',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AnimationScreen())
                              );
                            }),
                        _buildCategoryChip(
                            'Гэмт хэрэг',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Gemtheregscreen())
                              );
                            }
                        ),
                        _buildCategoryChip(
                            'Гэр бүл',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const GerBulscreen())
                              );
                            }
                        ),
                        _buildCategoryChip(
                            'Драма',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Dramascreen())
                              );
                            }
                        ),
                        _buildCategoryChip(
                            'Зэргэлдээ ертөнц',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ZergeldeeWorldscreen())
                              );
                            }
                        ),
                        _buildCategoryChip(
                            'Ид шид',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MagicScreen())
                              );
                            }
                        ),
                        _buildCategoryChip(
                            'Инээдэм',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const IneedemScreen())
                              );
                            }
                        ),
                        _buildCategoryChip(
                            'Мюзикл',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MusicalScreen())
                              );
                            }
                        ),
                        _buildCategoryChip(
                            'Нууцлаг',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MysteryScreen())
                              );
                            }
                        ),
                        _buildCategoryChip(
                            'Уран зөгнөлт',
                            false,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Uranzognoltscreen())
                              );
                            }
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Section 1
                  _buildSectionHeader('Үргэлжлүүлэх'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Үргэлжлүүлэх').toList()),

                  const SizedBox(height: 24),

                  // Section 2
                  _buildSectionHeader('ШИНЭ ГАРАЛТУУД'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Шинэ гаргалтууд').toList()),

                  const SizedBox(height: 24),

                  // Section 3
                  _buildSectionHeader('АДАЛ ЯВДАЛТ'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Адал явдалт').toList()),

                  // Section 4
                  _buildSectionHeader('ИНЭЭДЭМ'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Адал явдалт').toList()),

                  // Section 5
                  _buildSectionHeader('МЮЗИКЛ'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Мюзикл').toList()),

                  // Section 6
                  _buildSectionHeader('ДУРСАМЖ СЭРГЭМ'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Дурсамж сэргэм').toList()),
                  // Section 7
                  _buildSectionHeader('ХАЙР ДУРЛАЛ'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Хайр дурлал').toList()),
                  // Section 8
                  _buildSectionHeader('БАГАЧУУДАД'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Багачуудад').toList()),
                  // Section 9
                  _buildSectionHeader('ГЭР БҮЛ'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Гэр бүл').toList()),
                  // Section 10
                  _buildSectionHeader('ДРАМА'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Драма').toList()),
                  // Section 11
                  _buildSectionHeader('БИ АЙЖИЙНА'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Би айжийна').toList()),
                  //Section 12
                  _buildSectionHeader('Уран зөгнөлт'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Уран зөгнөлт').toList()),
                  //Section 13
                  _buildSectionHeader('АЙМШГИЙН'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Аймшгийн').toList()),
                  //Section 14
                  _buildSectionHeader('ГЭМТ ХЭРЭГ'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Гэмт хэрэг').toList()),
                  //Section 15
                  _buildSectionHeader('НУУЦЛАГ'),
                  const SizedBox(height: 12),
                  _buildMovieRow(movieList.where((m) => m.category == 'Нууцлаг').toList()),

                ],
              ),
            ),
          ),

          // Footer
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
                _buildBottomNavItem(0, Icons.home_outlined, 'НҮҮР'),
                _buildBottomNavItem(1, Icons.play_circle_outline, 'АНИМЕ'),
                _buildBottomNavItem(2, Icons.casino_outlined, 'RANDOM'),
                _buildBottomNavItem(3, Icons.movie_outlined, 'КИНО'),
                _buildBottomNavItem(4, Icons.theater_comedy_outlined, 'ТЕАТР'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieRow(List<MovieItem> items) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          int realIndex = movieList.indexOf(items[index]);
          return _buildMovieCard(items[index], realIndex);
        },
      ),
    );
  }

  Widget _buildMovieCard(MovieItem movie, int index) {
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
            // Image
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
                  child: movie.imagePath.isNotEmpty
                      ? Image.asset(
                    movie.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                      : Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          movie.color.withOpacity(0.6),
                          movie.color.withOpacity(0.3),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.movie,
                        size: 40,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Title
            Text(
              movie.title,
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
  }

  Widget _buildTopIcon(int index, IconData icon) {
    bool isSelected = selectedTopIcon == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTopIcon = index),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[600],
          size: 24,
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(int index, IconData icon, String label) {
    bool isSelected = selectedBottomTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedBottomTab = index),
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

  Widget _buildCategoryChip(String label, bool isSelected, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
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
      title: 'Profile Navigation UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF171B22),
      ),
      home: const ProfilePage(),
    );
  }
}
