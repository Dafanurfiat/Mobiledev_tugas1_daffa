import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Model/user_model.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<Data> getUserData() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      Data pengguna = UserModel.fromJson(body).data;
      return pengguna;
    } else {
      throw 'Error';
    }
  }

  late Future<Data> user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = getUserData();
  }

  //future build dart

  bool isTwitterButtonPressed = false;
  bool isInstagramButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Function to launch the URL
    void launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Ayam.gif'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 80),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: const Color.fromARGB(3, 254, 0, 0),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/Daffa.jpeg'),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromARGB(255, 146, 22, 168),
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth > 500 ? 50 : 25,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Text(
                      'Pangeran Dalam Mensejahterakan Kaum Wanita',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 146, 22, 168),
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth > 500 ? 20 : 14,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                  //mengambil data API
                  future: user,
                  builder: (context, snapshot) {
                    var connectionState = snapshot.connectionState;
                    if (connectionState == ConnectionState.none) {
                      return Text('Tidak ada Internet untuk mengakses');
                    } else if (connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color.fromARGB(255, 146, 22, 168),
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth > 500 ? 20 : 15,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama\t\t: Daffa Nur Fiat \nNIM\t\t\t\t\t: 220211060070\nHobi\t\t\t\t: Main sama bapak petir\nSaran\t\t: Lebih baik follow yang dibawah',
                                //${snapshot.data!.firstName}\nNIM\t\t\t\t\t: 220211060070\nHobi\t\t\t\t: Main sama bapak petir\nSaran\t\t: Lebih baik follow yang dibawah',
                                style: GoogleFonts.lato(
                                  color:
                                      const Color.fromARGB(255, 146, 22, 168),
                                  fontWeight: FontWeight.w700,
                                  fontSize: screenWidth > 500 ? 15 : 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                    return Text('No data');
                  }),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTapDown: (details) {
                        setState(() {
                          isTwitterButtonPressed = true;
                        });
                      },
                      onTapUp: (details) {
                        setState(() {
                          isTwitterButtonPressed = false;
                        });
                        // Launch the Twitter URL
                        launchURL('https://www.twitter.com/dapnurs');
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 7,
                          bottom: 7,
                        ),
                        decoration: BoxDecoration(
                          color: isTwitterButtonPressed
                              ? Colors.grey.withOpacity(0.5)
                              : const Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromARGB(255, 146, 22, 168),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              FlutterIcons.twitter_ant,
                              color: const Color.fromARGB(255, 146, 22, 168),
                              size: screenWidth > 500 ? 30 : 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTapDown: (details) {
                        setState(() {
                          isInstagramButtonPressed = true;
                        });
                      },
                      onTapUp: (details) {
                        setState(() {
                          isInstagramButtonPressed = false;
                        });
                        // Launch the Instagram URL
                        launchURL('https://www.instagram.com/dapnurs');
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 7,
                          bottom: 7,
                        ),
                        decoration: BoxDecoration(
                          color: isInstagramButtonPressed
                              ? Colors.grey.withOpacity(0.5)
                              : const Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromARGB(255, 146, 22, 168),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              FlutterIcons.instagram_ant,
                              color: const Color.fromARGB(255, 146, 22, 168),
                              size: screenWidth > 500 ? 30 : 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
