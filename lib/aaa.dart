import 'package:flutter/material.dart';
import 'saki/login_page.dart';
import 'saki/home_page.dart';

void main() => runApp(const StatelessApp());

class StatelessApp extends StatelessWidget {
  const StatelessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лаб 6 - Playmax App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0d1117),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/form': (context) => const FormLoginPage(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}

class AnimeItem {
  String title;
  double rating;
  String year;
  int episodes;
  String category;
  String description;
  bool isLiked;
  String imagePath;
  Color color;

  AnimeItem({
    required this.title,
    required this.rating,
    required this.year,
    required this.episodes,
    required this.category,
    required this.description,
    required this.isLiked,
    required this.imagePath,
    required this.color,
  });
}