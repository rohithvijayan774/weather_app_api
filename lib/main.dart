import 'package:flutter/material.dart';
import 'package:weather_app_sample/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Data',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home:const MainScreen(),
    );
  }
}
