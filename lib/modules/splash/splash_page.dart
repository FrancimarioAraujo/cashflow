import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cashflow/shared/theme/constants/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  String appName = "CashFlow";
  List<String> displayedLetters = [];
  double logoOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      logoOpacity = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    _animateText();
  }

  void _animateText() async {
    for (int i = 0; i < appName.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        displayedLetters.add(appName[i]);
      });
    }
    await Future.delayed(const Duration(milliseconds: 100));
    Modular.to.pushReplacementNamed('/auth/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: logoOpacity,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('assets/logo.png', fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              displayedLetters.join(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
