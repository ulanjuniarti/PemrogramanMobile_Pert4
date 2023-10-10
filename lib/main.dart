import 'package:flutter/material.dart';
import 'form.dart'; // Import file form.dart
import 'tap.dart';
import 'toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TapDemo(), // Tampilkan halaman TapDemo saat pertama kali dijalankan
    );
  }
}