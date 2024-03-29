import 'package:flutter/material.dart';
import 'package:flutter_danthocode/features/home/screen/home_page.dart';
import 'package:flutter_danthocode/features/home/screen/landing_screen.dart';
import 'package:flutter_danthocode/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'danthocode app',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const LandingScreen(),
    );
  }
}
