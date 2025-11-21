import 'package:flutter/material.dart';
import '../../data/models/education_model.dart';
import '../../core/colors.dart';

class EducationTile extends StatelessWidget {
  final EducationModel education;

  const EducationTile({super.key, required this.education});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.school, color: AppColors.primary),
      title: Text(
        education.qualification,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("${education.institution} • ${education.board}"),
      trailing: Text(
        education.year,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
    );
  }
}
