import 'package:flutter/material.dart';
import 'package:skoon/features/splashscreen/presentation/splashscreen/view/widgets/SplashScreenBody.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenBody(),
    );
  }
}
