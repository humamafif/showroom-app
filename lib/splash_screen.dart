import 'package:flutter/material.dart';
import 'package:showroom/features/common/widgets/initial_widget.dart';
import 'package:showroom/features/common/widgets/secondary_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isShow = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isShow = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/splashscreen.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          AnimatedOpacity(
            opacity: isShow ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: const InitialTextWidget(),
          ),
          AnimatedOpacity(
            opacity: isShow ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            child: const SecondaryTextWidget(),
          ),
        ],
      ),
    );
  }
}
