// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Image.asset(
              'assets/images/saulogo.png',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: const Color.fromARGB(255, 250, 86, 36),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'แอปพลิเคชันร้านหมูกระทะ\nเพื่อคนไทย\nโดยเด็กไทย\nสนใจแอปพลิเคชันติดต่อ',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.02,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'เด็กไอที SAU',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.035,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Image.asset(
              'assets/images/sauqr.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
