import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_with_api/utils/textTheme.dart';
import 'package:provider/provider.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(const Duration(seconds: 5), () {
      splashScreenProvider.setLoading(false);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash screen content goes here
            Text(
              "NEWS TODAY",
              style: NewsText.textMain
            ),
            if (splashScreenProvider.isLoading)
              LottieBuilder.asset(
                "assets/animations/Animation - 1702395258490 (2).json",
                fit: BoxFit.cover,
                repeat: true,
                height: 150,
                width: 150,
              )
          ],
        ),
      ),
    );
  }
}
