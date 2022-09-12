import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            'Profil',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: const Center(child: Text('ProfilPage')),
    );
  }
}
