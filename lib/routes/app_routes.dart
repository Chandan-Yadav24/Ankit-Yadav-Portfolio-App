import 'package:flutter/material.dart';
import '../ui/screens/about_screen.dart';
import '../ui/screens/experience_screen.dart';
import '../ui/screens/education_screen.dart';
import '../ui/screens/hobbies_screen.dart';
import '../ui/screens/contact_screen.dart';
import '../ui/screens/home_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const String home = '/home';
  static const String about = '/about';
  static const String experience = '/experience';
  static const String education = '/education';
  static const String hobbies = '/hobbies';
  static const String contact = '/contact';

  static Map<String, WidgetBuilder> get routes => {
    home: (_) => const HomeScreen(),
    about: (_) => const AboutScreen(),
    experience: (_) => const ExperienceScreen(),
    education: (_) => const EducationScreen(),
    hobbies: (_) => const HobbiesScreen(),
    contact: (_) => const ContactScreen(),
  };
}
