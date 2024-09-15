import 'package:burget_app/src/presentation/home/home_page.dart';
import 'package:burget_app/src/presentation/page/chat_page.dart';
import 'package:burget_app/src/presentation/page/favorite_page.dart';
import 'package:burget_app/src/presentation/page/profile_page.dart';
import 'package:burget_app/src/presentation/theme/my_color.dart';
import 'package:flutter/material.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  _ButtomNavBarState createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomePage(),
      const ProfilePage(),
      const ChatPage(),
      const FavoritePage(),
      // const ProfilePage(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 70,
        color: AppColors.pink,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Image.asset(
                currentIndex == 0
                    ? 'assets/images/icon1.png'
                    : 'assets/images/icon1.png',
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Image.asset(
                currentIndex == 1
                    ? 'assets/images/icon2.png'
                    : 'assets/images/icon2.png',
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 60), // Adding spacing for the middle icon
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              icon: Image.asset(
                currentIndex == 2
                    ? 'assets/images/icon3.png'
                    : 'assets/images/icon3.png',
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Image.asset(
                currentIndex == 3
                    ? 'assets/images/icon4.png'
                    : 'assets/images/icon4.png',
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
            bottom: 20.0), // Параметр для поднятия кнопки вверх

        child: SizedBox(
          width: 65, // Увеличение ширины кнопки
          height: 65, // Увеличение высоты кнопки
          child: FloatingActionButton(
            backgroundColor: AppColors.pink,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const CreatePage(),
              //   ),
              // );
            },
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: AppColors.widthT,
              size: 30, // Увеличение размера иконки
            ),
          ),
        ),
      ),
    );
  }
}
