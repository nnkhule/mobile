import 'package:flutter/material.dart';
import 'Film.dart';

class Uranzognoltscreen extends StatefulWidget {
  const Uranzognoltscreen({super.key});

  @override
  State<Uranzognoltscreen> createState() => _UranzognoltscreenState();
}

class _UranzognoltscreenState extends State<Uranzognoltscreen> {
  String selectedGenre = "Уран зөгнөлт";
  String selectedSeason = "Бүгд";
  String selectedStatus = "Бүгд";
  String selectedSort = "Шинэ";

  void showDropdown(List<String> items, String title, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black.withOpacity(0.9),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SizedBox(
          height: 350,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Text(title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
              const Divider(color: Colors.white24),
              Expanded(
                child: ListView(
                  children: items.map((e) {
                    return ListTile(
                      title: Text(e, style: const TextStyle(color: Colors.white)),
                      onTap: () {
                        onSelect(e);
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = movieList.where((m) => m.category == "Уран зөгнөлт").toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0d1117),

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
        title: const Text("КИНО ҮЗВЭРҮҮД", style: TextStyle(color: Colors.white)),
        centerTitle: false,
      ),

      body: Column(
        children: [
          // FILTER BAR
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: const Color(0xFF0d1117),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildFilter("Ангилал", selectedGenre, [
                  "Адал явдалт",
                  "Аймшгийн",
                  "Анимэйшн",
                  "Би айжийна",
                  "Багачуудад",
                  "Гэмт хэрэг",
                  "Гэр бүл",
                  "Дайн",
                  "Драма",
                  "Зэргэлдээ ертөнц",
                  "Ид шид",
                  "Инээдэм",
                  "Мюзикл",
                  "Нууцлаг",
                  "Уран зөгнөлт"
                ], (value) {
                  setState(() => selectedGenre = value);
                }),
                buildFilter("Улирал", selectedSeason, [
                  "Бүгд", "2025 НАМАР", "2025 ЗУН", "2025 ХАВАР",
                  "2025 ӨВӨЛ", "2024 НАМАР", "2024 ЗУН", "2024 ХАВАР", "2024 ӨВӨЛ",
                  "2023 НАМАР", "2023 ЗУН", "2023 ХАВАР", "2023 ӨВӨЛ",
                  "2022 НАМАР", "2022 ЗУН", "2022 ХАВАР", "2022 ӨВӨЛ",
                  "2021 НАМАР", "2021 ЗУН", "2021 ХАВАР", "2021 ӨВӨЛ",
                ], (value) {
                  setState(() => selectedSeason = value);
                }),
                buildFilter("Төлөв", selectedStatus, ["Гарч байгаа", "Дууссан"],
                        (value) {
                      setState(() => selectedStatus = value);
                    }),
                buildFilter("Эрэмбэ", selectedSort, ["A-Z", "Z-A"],
                        (value) {
                      setState(() => selectedSort = value);
                    }),
              ],
            ),
          ),

          // MOVIE GRID
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.56,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final movie = filteredList[index];

                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(movie.imagePath, fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        "⭐ ${movie.rating}/10",
                        style: TextStyle(color: Colors.grey[400], fontSize: 10),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // FILTER BUTTON WIDGET
  Widget buildFilter(
      String label, String value, List<String> items, Function(String) onSelect) {
    return GestureDetector(
      onTap: () => showDropdown(items, label, onSelect),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text("$label\n$value",
                style: const TextStyle(color: Colors.white, fontSize: 10)),
            const Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
