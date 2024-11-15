import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class SurveyPage extends StatefulWidget {
  final HomeController controller;

  const SurveyPage(this.controller, {super.key});

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  int? _selectedGraduationYear;
  bool? _isEmployed;
  int _range = 0;
  bool? _jobType;
  bool? _furtherEducation;
  int _isSatisfied = 0;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              Text(
                'Alumni Tracer Survey',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Biodata Section
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      'Biodata Alumni',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),

                    // Nama Alumni
                    _buildFormSection(
                      title: 'Nama Lengkap',
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan nama lengkap',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),

                    // Tahun Kelulusan
                    _buildFormSection(
                      title: 'Tahun Kelulusan',
                      child: DropdownButtonFormField<int>(
                        decoration: InputDecoration(
                          hintText: 'Pilih tahun kelulusan',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        value: _selectedGraduationYear,
                        items: List.generate(
                          21,
                          (index) => DropdownMenuItem(
                            value: 2004 + index,
                            child: Text((2004 + index).toString()),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedGraduationYear = value;
                          });
                        },
                      ),
                    ),

                    // Program Studi
                    _buildFormSection(
                      title: 'Program Studi',
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan program studi',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),

                    // IPK
                    _buildFormSection(
                      title: 'IPK (Indeks Prestasi Kumulatif)',
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan IPK terakhir Anda',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    // Status Pekerjaan Section
                    Text(
                      'Status Pekerjaan',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),

                    _buildFormSection(
                      title: 'Apakah Anda sedang bekerja?',
                      child: Column(
                        children: [
                          RadioListTile<bool>(
                            title: Text('Ya'),
                            value: true,
                            groupValue: _isEmployed,
                            onChanged: (value) {
                              setState(() {
                                _isEmployed = value;
                              });
                            },
                          ),
                          RadioListTile<bool>(
                            title: Text('Tidak'),
                            value: false,
                            groupValue: _isEmployed,
                            onChanged: (value) {
                              setState(() {
                                _isEmployed = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    _buildFormSection(
                      title:
                          'Jika ya, berapa lama waktu yang dibutuhkan untuk mendapatkan pekerjaan setelah lulus?',
                      child: Column(
                        children: [
                          RadioListTile<int>(
                            title: Text('Kurang dari 3 bulan'),
                            value: 0,
                            groupValue: _range,
                            onChanged: (value) {
                              setState(() {
                                _range = value!;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: Text('3-6 bulan'),
                            value: 1,
                            groupValue: _range,
                            onChanged: (value) {
                              setState(() {
                                _range = value!;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: Text('7-12 bulan'),
                            value: 2,
                            groupValue: _range,
                            onChanged: (value) {
                              setState(() {
                                _range = value!;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: Text('Lebih dari 1 tahun'),
                            value: 3,
                            groupValue: _range,
                            onChanged: (value) {
                              setState(() {
                                _range = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    // Perusahaan, Jabatan, Lokasi
                    _buildFormSection(
                      title: 'Di mana Anda bekerja saat ini?',
                      child: Column(
                        children: [
                          _buildTextField('Nama Perusahaan:'),
                          _buildTextField('Jabatan:'),
                          _buildTextField('Lokasi (Kota, Negara):'),
                        ],
                      ),
                    ),

                    // Pekerjaan sesuai bidang studi
                    _buildFormSection(
                      title:
                          'Apakah pekerjaan Anda sesuai dengan bidang studi?',
                      child: Column(
                        children: [
                          RadioListTile<bool>(
                            title: Text('Sesuai'),
                            value: true,
                            groupValue: _jobType,
                            onChanged: (value) {
                              setState(() {
                                _jobType = value;
                              });
                            },
                          ),
                          RadioListTile<bool>(
                            title: Text('Tidak Sesuai'),
                            value: false,
                            groupValue: _jobType,
                            onChanged: (value) {
                              setState(() {
                                _jobType = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    // Pendidikan Lanjut
                    _buildFormSection(
                      title:
                          'Apakah Anda melanjutkan pendidikan setelah lulus?',
                      child: Column(
                        children: [
                          RadioListTile<bool>(
                            title: Text('Ya'),
                            value: true,
                            groupValue: _furtherEducation,
                            onChanged: (value) {
                              setState(() {
                                _furtherEducation = value;
                              });
                            },
                          ),
                          RadioListTile<bool>(
                            title: Text('Tidak'),
                            value: false,
                            groupValue: _furtherEducation,
                            onChanged: (value) {
                              setState(() {
                                _furtherEducation = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),

                    // Feedback Section
                    Text(
                      'Feedback',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),

                    // Kepuasan
                    _buildFormSection(
                      title:
                          'Seberapa puas Anda dengan persiapan kampus untuk dunia kerja?',
                      child: Column(
                        children: [
                          RadioListTile<int>(
                            title: Text('Sangat Puas'),
                            value: 0,
                            groupValue: _isSatisfied,
                            onChanged: (value) {
                              setState(() {
                                _isSatisfied = value!;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: Text('Puas'),
                            value: 1,
                            groupValue: _isSatisfied,
                            onChanged: (value) {
                              setState(() {
                                _isSatisfied = value!;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: Text('Cukup Puas'),
                            value: 2,
                            groupValue: _isSatisfied,
                            onChanged: (value) {
                              setState(() {
                                _isSatisfied = value!;
                              });
                            },
                          ),
                          RadioListTile<int>(
                            title: Text('Tidak Puas'),
                            value: 3,
                            groupValue: _isSatisfied,
                            onChanged: (value) {
                              setState(() {
                                _isSatisfied = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    // Feedback
                    _buildFormSection(
                      title: 'Kritik dan Saran',
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan feedback Anda',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        maxLines: 3,
                      ),
                    ),

                    // Submit Button
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          )),
      selectedIndex: 1, // Survey tab is selected
      controller: widget.controller,
    );
  }

  Widget _buildFormSection({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
