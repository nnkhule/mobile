import 'package:flutter/material.dart';
import 'aaa.dart';
import '/anime_data.dart';
import '/anime_card.dart';

class BrowseAnimePage extends StatefulWidget {
  final String category;

  const BrowseAnimePage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<BrowseAnimePage> createState() => _BrowseAnimePageState();
}

class _BrowseAnimePageState extends State<BrowseAnimePage> {
  String selectedCategory = 'Бүх аниме';
  final List<String> categories = [
    'Бүх аниме',
    'Үргэлжлүүлэх',
    'Шинэ гаргалтууд',
    'Өөр ертөнцөд өрнөдөг',
    'Онцлох',
    'Дахин төрөлт',
    'Хайр дурлал, романс',
    'Монгол',
    'Цэрэг, арми',
    'Шинжлэх ухаан',
    'Хуучны дурсамж сэргээм',
    'Спорт',
    'Мөрдлөгө',
    'Онцгой хүч',
    'Хятад',
    'Цус сорогч,чөтгөр',
    'Тоглоом, бооцоо',
    'Хөгжим',
    'Сүнс',
    'Урт үргэлжилсэн',
    'Сургууль, өдөр тутам',
    'Инээдэм, хөгжилтэй',
    'Гардан тулаан',
    'Ид шид, оцгой хүч',
    'Эротик',
    'Анимэйшн',
    'Их үзэлттэй',
  ];

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category;
  }

  List<AnimeItem> getFilteredAnime() {
    if (selectedCategory == 'Бүх аниме') {
      return animeList;
    }
    return animeList.where((anime) => anime.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredAnime = getFilteredAnime();

    return Scaffold(
      backgroundColor: const Color(0xFF0d1117),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0d1117),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          selectedCategory.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: const Color(0xFF0d1117),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryChip(categories[index]);
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFF1a2744).withOpacity(0.3),
            child: Text(
              '${filteredAnime.length} анимэ олдлоо',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 13,
              ),
            ),
          ),

          Expanded(
            child: filteredAnime.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.movie_filter_outlined,
                    size: 64,
                    color: Colors.grey[700],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Анимэ олдсонгүй',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
                : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 128 / 220,
              ),
              itemCount: filteredAnime.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AnimeCardWidget(
                        animeItem: filteredAnime[index],
                        onTap: () {
                          // Анимэ дэлгэрэнгүй рүү шилжих
                          print('Clicked: ${filteredAnime[index].title}');
                        },
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      filteredAnime[index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
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
          category,
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