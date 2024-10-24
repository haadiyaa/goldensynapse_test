import 'package:flutter/material.dart';
import 'package:goldensynapse_task/core/appcolors.dart';
import 'package:goldensynapse_task/core/apptextstyle.dart';
import 'package:goldensynapse_task/presentation/splashscreen/splashscreen.dart';
import 'package:goldensynapse_task/providers/functionsprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FunctionsProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.lightBlue,
          appBarTheme: AppBarTheme(
            titleTextStyle: AppTextStyle.head,
            backgroundColor: AppColors.lightBlue2,
          ),
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
