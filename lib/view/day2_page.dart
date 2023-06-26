import 'package:flutter/material.dart';
import 'package:mobiledev_flutter_1/theme.dart';

class Day2Page extends StatelessWidget {
  const Day2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
        children: [
          Text(
            'Health First',
            style: poppinsTextStyle.copyWith(
                fontSize: 24,
                color: const Color.fromARGB(255, 120, 18, 138),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Exercise together with our best community fit in the world',
            style: poppinsTextStyle.copyWith(
              fontSize: 16,
              color: const Color.fromARGB(255, 146, 22, 168),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 70),
            height: 402,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/gallery.png'), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 120, 18, 138),
              ),
              child: Text(
                'Shape My Body',
                style: poppinsTextStyle.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Terms & Conditions',
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Color.fromARGB(
                  255, 120, 18, 138), // Mengatur warna tulisan menjadi ungu
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
