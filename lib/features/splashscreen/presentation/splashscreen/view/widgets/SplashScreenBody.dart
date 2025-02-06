import 'package:flutter/material.dart';
import 'package:skoon/core/utilies/app_images.dart';

import '../../../../../onboarding/presentation/view/firstonboarding.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  @override
  void initState() {
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 5),lowerBound: 75,upperBound: 250);
    _animationController.forward();
    Future.delayed(Duration(seconds: 9),() {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => FirstOnboarding(),), (route) => false,);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
          builder: (context, child) =>
              Center(
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  height:_animationController.value ,
                        decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("${assets.logo}"),)
                        ),
                        duration: Duration(seconds: 5)),
              ),

    ));
  }
}
