import 'package:flutter/material.dart';
import '../../data/models/hobby_model.dart';
import '../../core/colors.dart';

class HobbyChip extends StatelessWidget {
  final HobbyModel hobby;

  const HobbyChip({super.key, required this.hobby});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Image.asset(hobby.iconPath, width: 20, height: 20),
      label: Text(hobby.name),
      backgroundColor: AppColors.primary.withOpacity(0.1),
    );
  }
}
