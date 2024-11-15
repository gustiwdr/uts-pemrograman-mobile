import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, Alumni!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/campus.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Tujuan E-Tracer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  'Tujuan Tracer Study',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                    'Tracer Study dilakukan agar dapat menitikberatkan pada rekam jejak alumni yang terdiri dari informasi karir/pekerjaan lulusan, serta digunakan untuk evaluasi dalam hal pembelajaran (akademik) dan pelayanan (non-akademik) pada tingkat Fakultas/Prodi dan juga Universitas.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                    )),
              ],
            ),
          ),
        ],
      ),
      selectedIndex: 0, // Home tab is selected
      controller: controller,
    );
  }
}
