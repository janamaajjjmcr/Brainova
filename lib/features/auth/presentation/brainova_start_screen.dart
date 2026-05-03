import 'package:flutter/material.dart';
import 'package:brainova/l10n/app_localizations.dart';

class BrainovaStartScreen extends StatelessWidget {
  const BrainovaStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withValues(alpha: 0.45),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Builder(builder: (context) {
                return Text(
                  AppLocalizations.of(context).brainovaStartMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
