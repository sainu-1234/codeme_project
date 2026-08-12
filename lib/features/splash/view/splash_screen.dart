import 'dart:async';

import 'package:codeme_project/features/bottomnavigationbar/view/bottomnavigationbar_screen.dart';

import 'package:codeme_project/utils/colorutils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    scaleAnimation = Tween<double>(begin: 0.75, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    animationController.forward();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomnavigationScreen()),
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: Colorutils.primecolor,
          ),
        ),

        child: SafeArea(
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: fadeAnimation,
                child: ScaleTransition(scale: scaleAnimation, child: child),
              );
            },

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // =====================================================
                // LOGO
                // =====================================================
                Container(
                  height: width * 0.30,
                  width: width * 0.30,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 30,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),

                  child: Icon(
                    Icons.shopping_bag_rounded,
                    size: width * 0.15,
                    color: Colorutils.buttoncolor,
                  ),
                ),

                SizedBox(height: height * 0.035),

                // =====================================================
                // APP NAME
                // =====================================================
                const Text(
                  "SHOPORA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Everything you love, in one place",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),

                SizedBox(height: height * 0.08),

                // =====================================================
                // LOADING INDICATOR
                // =====================================================
                SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
