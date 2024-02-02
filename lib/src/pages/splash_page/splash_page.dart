import 'package:flutter/material.dart';

class SplashPages extends StatefulWidget {

  const SplashPages({super.key});

  @override
  State<SplashPages> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashPages> {

  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_){ 
      Navigator.of(context).pushReplacementNamed('/auth/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(child: Image.asset('assets/images/logo_vertical.png'),));
  }
}