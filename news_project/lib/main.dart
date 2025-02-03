import 'package:flutter/material.dart';
import 'package:news_project/ui/home_screen/category_details/source_details.dart';
import 'package:news_project/ui/home_screen/home_screen.dart';
import 'package:news_project/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // كله تمام كده يا هندسه
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName  : (context) => HomeScreen(),

      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
     themeMode: ThemeMode.dark,
    );
  }
}

