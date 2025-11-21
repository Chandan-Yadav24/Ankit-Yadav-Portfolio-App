import 'package:flutter/material.dart';
import '../../core/colors.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const MainLayout({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.primary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Kuber Sukla",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    "Telephone Technician",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              text: "About",
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            _buildDrawerItem(
              icon: Icons.work,
              text: "Experience",
              onTap: () => Navigator.pushNamed(context, '/experience'),
            ),
            _buildDrawerItem(
              icon: Icons.school,
              text: "Education",
              onTap: () => Navigator.pushNamed(context, '/education'),
            ),
            _buildDrawerItem(
              icon: Icons.sports_esports,
              text: "Hobbies",
              onTap: () => Navigator.pushNamed(context, '/hobbies'),
            ),
            _buildDrawerItem(
              icon: Icons.email,
              text: "Contact",
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
          ],
        ),
      ),
      body: SafeArea(child: child),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(text),
      onTap: onTap,
    );
  }
}
