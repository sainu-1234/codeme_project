import 'package:codeme_project/features/bottomnavigationbar/view/bottomnavigationbar_screen.dart';
import 'package:codeme_project/features/homescreenpage/controller/homescreen_controller.dart';
import 'package:codeme_project/features/homescreenpage/view/productdetailes_screen.dart';
import 'package:codeme_project/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomescreenController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), debugShowCheckedModeBanner: false);
  }
}
