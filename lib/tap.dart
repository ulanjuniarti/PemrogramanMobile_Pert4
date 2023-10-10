import 'package:flutter/material.dart';
import 'form.dart'; // Import file form.dart
import 'toast.dart'; // Import file form.dart

class TapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Pindah ke halaman FormDemo saat tombol ditekan
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormDemo()),
          );
        },
        child: Text('Tekan'),
      ),
    );
  }
}