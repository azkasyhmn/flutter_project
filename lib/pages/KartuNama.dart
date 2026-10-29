import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KartuNama extends StatelessWidget {
  const KartuNama({super.key});

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color.fromARGB(255, 108, 35, 125);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 142, 68, 173),
              Color.fromARGB(255, 74, 20, 140),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 67,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Azuka',
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  'Computer Science Student',
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    color: Colors.white70,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(
                  height: 25,
                  width: 350,
                  child: Divider(color: Colors.white38, thickness: 1),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone_android,
                      size: 25,
                      color: mainColor,
                    ),
                    title: Text(
                      '0101010101',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      size: 25,
                      color: mainColor,
                    ),
                    title: Text(
                      '@syhmnazuka',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.facebook,
                      size: 25,
                      color: mainColor,
                    ),
                    title: Text(
                      'Azuka',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.tiktok,
                      size: 25,
                      color: mainColor,
                    ),
                    title: Text(
                      'Zkaa',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
