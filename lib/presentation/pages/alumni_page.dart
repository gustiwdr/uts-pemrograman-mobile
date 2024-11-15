import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class AlumniPage extends StatelessWidget {
  final HomeController controller;

  const AlumniPage(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    // Sample alumni data with contact information
    final alumniList = [
      {
        'name': 'John Doe',
        'year': '2020',
        'position': 'Software Engineer',
        'company': 'ABC Corp',
        'contact': 'john.doe@example.com',
        'imageUrl':
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGF2YXRhcnN8ZW58MHx8MHx8fDA%3D'
      },
      {
        'name': 'Jane Smith',
        'year': '2019',
        'position': 'Product Manager',
        'company': 'XYZ Ltd',
        'contact': 'jane.smith@example.com',
        'imageUrl':
            'https://plus.unsplash.com/premium_photo-1689977927774-401b12d137d6?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fFBob3RvJTIwZGUlMjBwcm9maWx8ZW58MHx8MHx8fDA%3D'
      },
      {
        'name': 'Ella Johnson',
        'year': '2021',
        'position': 'Data Scientist',
        'company': 'Tech Innovations',
        'contact': 'johnson@example.com',
        'imageUrl':
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGFwcHklMjB3b21hbnxlbnwwfHwwfHx8MA%3D%3D'
      },
      {
        'name': 'May Roe',
        'year': '2022',
        'position': 'Android Developer',
        'company': 'Bro Tech',
        'contact': 'roeeee@example.com',
        'imageUrl':
            'https://media.istockphoto.com/id/1326417862/photo/young-woman-laughing-while-relaxing-at-home.jpg?s=612x612&w=0&k=20&c=cd8e6RBGOe4b8a8vTcKW0Jo9JONv1bKSMTKcxaCra8c='
      },
      // Add more alumni data here
    ];

    return BasePage(
      bodyContent: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Alumni List',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: alumniList.length,
                itemBuilder: (context, index) {
                  final alumni = alumniList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              alumni['imageUrl']!, // Use network image URL
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  alumni['name']!,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                _buildRow(Icons.calendar_today,
                                    'Tahun Lulus: ${alumni['year']}'),
                                SizedBox(height: 8),
                                _buildRow(Icons.work, '${alumni['position']}'),
                                SizedBox(height: 8),
                                _buildRow(
                                    Icons.business, '${alumni['company']}'),
                                SizedBox(height: 8),
                                _buildRow(Icons.contact_mail,
                                    '${alumni['contact']}'), // Added contact row
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      selectedIndex: 2, // Alumni tab is selected
      controller: controller,
    );
  }

  Widget _buildRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.blue,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black45,
            ),
          ),
        ),
      ],
    );
  }
}
