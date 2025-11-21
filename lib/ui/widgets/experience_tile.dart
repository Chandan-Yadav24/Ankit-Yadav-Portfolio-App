import 'package:flutter/material.dart';
import '../../data/models/experience_model.dart';
import '../../core/colors.dart';

class ExperienceTile extends StatelessWidget {
  final ExperienceModel experience;

  const ExperienceTile({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${experience.company} • ${experience.duration}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            ...experience.responsibilities
                .map((task) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("• "),
                Expanded(child: Text(task)),
              ],
            ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
