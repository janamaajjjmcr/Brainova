import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:go_router/go_router.dart';

class RiveIntroScreen extends StatefulWidget {
  const RiveIntroScreen({super.key});

  @override
  State<RiveIntroScreen> createState() => _RiveIntroScreenState();
}

class _RiveIntroScreenState extends State<RiveIntroScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      if (mounted) {
        context.go('/check-permissions');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0F172A),
      body: Center(
        child: RiveAnimation.asset(
          'assets/rive/final_login_page.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
