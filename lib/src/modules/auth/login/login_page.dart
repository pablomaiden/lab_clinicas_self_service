

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(title: const Text('jkhkjh')),
      body: SingleChildScrollView(child: Container(constraints: BoxConstraints(minHeight: sizeOf.height),
      decoration: BoxDecoration(image: DecorationImage(image: 'assets/images/background_login.png')),)),
    );
  }
}