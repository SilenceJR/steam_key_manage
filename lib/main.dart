import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:steam_key_manage/ui/home/home_page.dart';
import 'package:steam_key_manage/ui/humble/humble_page.dart';

void main() {
  sqfliteFfiInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SteamKeyManage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      // home: const HomePage(),
      home: const HumblePage(),
    );
  }
}
