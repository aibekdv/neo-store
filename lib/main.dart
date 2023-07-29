import 'package:flutter/material.dart';
import 'package:neo_store/config/config.dart';
import 'package:neo_store/pages/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce app',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const SearchPage(),
    );
  }
}
