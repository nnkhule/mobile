import 'package:flutter/material.dart';
import 'package:untitled1/my_collection_page.dart';
import 'personal_info_page.dart';
import 'extend_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _showCouponDialog(BuildContext context) {
    final TextEditingController couponController = TextEditingController();

    // купон кодын жагсаалт
    final validCoupons = {
      "ANIMAX2025": "Animax багц 1 сар үнэгүй",
      "MOVIE50": "Кино багц 50% хямдрал",
      "FREEMONTH": "Премиум эрх 1 сар",
      "WELCOME10": "Шинэ хэрэглэгчид 10% бонус",
    };

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF171B22),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text(
            'Купон код оруулах',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          content: TextField(
            controller: couponController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Кодоо энд оруулна уу',
              hintStyle: const TextStyle(color: Colors.white54),
              filled: true,
              fillColor: const Color(0xFF222730),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Болих', style: TextStyle(color: Colors.white54)),
            ),
            ElevatedButton(
              onPressed: () {
                String input = couponController.text.trim().toUpperCase();

                Navigator.pop(context);

                if (validCoupons.containsKey(input)) {
                  // 🟢 Хэрвээ зөв купон бол
                  _showSuccessPopup(context, input, validCoupons[input]!);
                } else {
                  // 🔴 Хэрвээ буруу бол
                  _showErrorPopup(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Идэвхжүүлэх'),
            ),
          ],
        );
      },
    );
  }


  void _showErrorPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF222730),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Center(
            child: Icon(Icons.error, color: Colors.redAccent, size: 60),
          ),
          content: const Text(
            'Таны оруулсан купон код буруу эсвэл хүчинтэй бус байна.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Дахин оролдох'),
              ),
            ),
          ],
        );
      },
    );
  }


  void _showSuccessPopup(BuildContext context, String code, String reward) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF222730),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Center(
            child: Icon(Icons.check_circle, color: Colors.greenAccent, size: 60),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Таны купон амжилттай идэвхжлээ!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text('Код: $code',
                  style: const TextStyle(color: Colors.white54, fontSize: 13)),
              const SizedBox(height: 8),
              Text(reward,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Хаах'),
              ),
            )
          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white70),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                const Text(
                  "ТАНЫ ID: ",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const Text(
                  "753305",
                  style: TextStyle(color: Colors.redAccent, fontSize: 14),
                ),
     ],
    ),


            const SizedBox(height: 20),



          // Profile section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF222730),
                borderRadius: BorderRadius.circular(8),

              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images.jpg'),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("UNDRAA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text("753305", style: TextStyle(color: Colors.white54, fontSize: 13)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 18),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const PersonalInfoPage()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Anime/Kino section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF222730),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text("28", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("аниме хоног", style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                  Container(height: 30, width: 1, color: Colors.white24),
                  Column(
                    children: const [
                      Text("14", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("кино хоног", style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Энэ сард төхөөрөмж шилжүүлэх 4 эрх байна",
                style: TextStyle(color: Colors.white38, fontSize: 12)),
            const SizedBox(height: 20),

            // Menu items
            _MenuItem(
              title: "Эрх сунгах",
              icon: Icons.credit_card,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ExtendPage()),
              ),
            ),
            _MenuItem(
                title: "Миний сан",
                icon: Icons.favorite_border,
                onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MyCollectionPage()),
            )
            ),
            _MenuItem(
              title: "Купон эрх",
              icon: Icons.card_giftcard,
              onTap: () => _showCouponDialog(context),
            ),

            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(Icons.logout, color: Colors.redAccent),
                  SizedBox(width: 8),
                  Text("ГАРАХ", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],

        ),

      ),

    );

  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuItem({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontSize: 15)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white38),
          ],
        ),
      ),
    );
  }
}
