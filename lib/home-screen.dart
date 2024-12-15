import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hasadak_1/photos/images.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              Photos.logo,
              scale: 12,
            ),
            SizedBox(width: 10),
            Text(
              'Hasadak  🌱',
              style: GoogleFonts.domine(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF56ab91),
      ),
    );
  }
}
