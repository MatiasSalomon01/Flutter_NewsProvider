import 'package:flutter/material.dart';
import 'package:news_app/src/screens/screens.dart';
import 'package:news_app/src/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: TabsScreen(),
      theme: theme,
    );
  }
}