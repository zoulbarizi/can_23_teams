import 'package:can_23_teams/utils/consts.dart';
import 'package:can_23_teams/views/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAN 2023',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Consts.color1),
        useMaterial3: true,
      ),
      home: const Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
