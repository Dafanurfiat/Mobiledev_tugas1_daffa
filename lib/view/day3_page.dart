import 'package:flutter/material.dart';

class Day3Page extends StatelessWidget {
  const Day3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.only(left: 40, top: 70, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 70),
                padding: const EdgeInsets.all(9),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0XFFFCAC15),
                ),
                child: Center(
                  child: Image.asset('assets/icon-euro.png'),
                ),
              ),
              const Text(
                'Welcome back.\nLets make money.',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 70,
              ),
              const TextField(
                decoration: InputDecoration(
                  fillColor: Color(0XFF262a34),
                  filled: true,
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  label: Text('your@email.com'),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Color(0XFF6F7075),
                  ),
                  fillColor: Color(0XFF262a34),
                  filled: true,
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  label: Text('password'),
                  labelStyle: TextStyle(
                    color: Color(0XFF6F7075),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(),
                  Text(
                    'Forgot My Password',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0XFF6A6B70),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 115,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFFFCAC15),
                  ),
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Dont have account? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
