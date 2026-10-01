import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GetYourTicketApp());
}

class GetYourTicketApp extends StatelessWidget {
  const GetYourTicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GET your Ticket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1261FF)),
        scaffoldBackgroundColor: const Color(0xFFF6F8FC),
      ),
      home: const HomeScreen(),
    );
  }
}
