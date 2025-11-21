import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'routes/app_routes.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/about_screen.dart';
import 'ui/screens/experience_screen.dart';
import 'ui/screens/education_screen.dart';
import 'ui/screens/hobbies_screen.dart';
import 'ui/screens/contact_screen.dart';
import 'ui/screens/splash_screen.dart';

void main() {
  runApp(const KuberPortfolioApp());
}

class KuberPortfolioApp extends StatelessWidget {
  const KuberPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ankit Yadav Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // from core/theme.dart
      // Start with SplashScreen, then navigate to HomeScreen
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.about: (_) => const AboutScreen(),
        AppRoutes.experience: (_) => const ExperienceScreen(),
        AppRoutes.education: (_) => const EducationScreen(),
        AppRoutes.hobbies: (_) => const HobbiesScreen(),
        AppRoutes.contact: (_) => const ContactScreen(),
      },
    );
  }
}
