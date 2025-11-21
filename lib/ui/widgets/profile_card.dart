// lib/ui/widgets/profile_card.dart
import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../data/models/profile_model.dart';
import '../../data/dummy_data.dart';

class ProfileCard extends StatelessWidget {
  final ProfileModel? profile;

  const ProfileCard({Key? key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use passed profile if available, otherwise fallback to DummyData
    final ProfileModel data = profile ?? DummyData.profile;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(data.profileImage),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data.tagline,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
