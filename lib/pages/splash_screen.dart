import 'package:flutter/material.dart';
import 'package:my_doctor/components/logo_icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoIcon(),
            SizedBox(height: 20),
            Text(
              'My Doctor',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
