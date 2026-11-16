import 'package:flutter/material.dart';
import 'package:space/core/constants/routes.dart';
import 'package:space/core/constants/strings.dart';
import 'package:space/ui/details_page/details_screen.dart';
import 'package:space/core/theme/app_theme.dart';
import 'package:space/ui/home_page/home_screen.dart';
import 'package:space/ui/landing_page/landing_page.dart';

import 'core/theme/app_theme.dart';


void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      debugShowCheckedModeBanner: false,
      theme : AppTheme.appTheme,
      initialRoute: Routes.landingRoute,
      routes: {
        Routes.landingRoute:(_) => const LandingScreen(),
        Routes.homeRoute:(_) => const HomeScreen(),
        Routes.detailsRoute:(_) => const DetailsScreen(),
      },
    );
  }
}
