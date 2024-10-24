import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:goldensynapse_task/core/appcolors.dart';
import 'package:goldensynapse_task/core/apptextstyle.dart';
import 'package:goldensynapse_task/core/constants.dart';
import 'package:goldensynapse_task/presentation/homescreen/view/homescreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: AppColors.white,
        backgroundImage: const Image(
          image: AssetImage(Constants.bgImage),
          fit: BoxFit.cover,
        ),
        childWidget: Center(
          child: SizedBox(
            width: size.width * 0.6,
            child: const Text(
              'Habit tracker',
              textAlign: TextAlign.center,
              style: AppTextStyle.head,
            ),
          ),
        ),
        onAnimationEnd: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        },
      ),
    );
  }
}
