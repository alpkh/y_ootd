import 'package:flutter/material.dart';
import 'rankpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    //이게 하나하나의 화면이되고, Text등을 사용하거나, dart파일에 있는 class를 넣는다.
    // const HomePage(),
    // const SearchPage(),
    // const GetPhoto(),
    RankPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'OOY',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 45,
            letterSpacing: 3.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.green),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: 'create'),
          BottomNavigationBarItem(
              icon: Icon(Icons.military_tech_sharp), label: 'rank'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'myinfo'),
        ],
      ),
    );
  }
}
