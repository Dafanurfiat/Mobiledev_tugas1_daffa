import 'package:flutter/material.dart';
import 'package:mobiledev_flutter_1/view/day2_page.dart';
import 'package:mobiledev_flutter_1/view/day3_page.dart';
import 'package:mobiledev_flutter_1/view/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final pages = [
    const Day2Page(),
    const ProfilePage(),
    const Day3Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurpleAccent, //Mengatur latar belakang home page
        body: pages[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedPage,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            backgroundColor: const Color(0XFF181A20), // Mengatur latar belakang pada bottom navigation bar
            unselectedItemColor: Colors.grey, // Mengatur warna abu-abu untuk ikon dan teks yang tidak terpilih
            selectedItemColor: const Color.fromARGB(255, 120, 18, 138), // Mengatur warna ungu untuk ikon dan teks yang dipilih
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: 'Other'),
            ]),
      ),
    );
  }
}
