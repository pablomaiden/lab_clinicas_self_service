import 'package:flutter/material.dart';

class SplashPages extends StatefulWidget {

  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(child: Image.asset('assets/images/logo_vertical.png'),));
  }
}