import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../ui/layout/main_layout.dart';
import '../../../data/dummy_data.dart';
import '../../ui/widgets/profile_card.dart';
import '../../ui/widgets/section_title.dart';
import '../../../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _profileScale;

  final quickLinks = [
    {
      "icon": Icons.person,
      "text": "About Me",
      "route": AppRoutes.about,
      "image": "assets/images/about.jpg"
    },
    {
      "icon": Icons.work,
      "text": "Experience",
      "route": AppRoutes.experience,
      "image": "assets/images/experience.jpg"
    },
    {
      "icon": Icons.school,
      "text": "Education",
      "route": AppRoutes.education,
      "image": "assets/images/education.jpg"
    },
    {
      "icon": Icons.sports_esports,
      "text": "Hobbies",
      "route": AppRoutes.hobbies,
      "image": "assets/images/hobbies.jpg"
    },
    {
      "icon": Icons.email,
      "text": "Contact",
      "route": AppRoutes.contact,
      "image": "assets/images/contact.jpg"
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _profileScale = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = DummyData.profile;

    return MainLayout(
      title: "Portfolio",
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScaleTransition(
              scale: _profileScale,
              child: Hero(
                tag: "profileHero",
                child: ProfileCard(profile: profile),
              ),
            ),
            const SizedBox(height: 20),
            const SectionTitle(title: "Quick Links"),
            const SizedBox(height: 10),

            // Grid Layout
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: quickLinks.length,
              itemBuilder: (context, index) {
                final item = quickLinks[index];
                return _GlassGridItem(
                  icon: item["icon"] as IconData,
                  text: item["text"] as String,
                  imagePath: item["image"] as String,
                  onTap: () => Navigator.pushNamed(
                    context,
                    item["route"] as String,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassGridItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final String imagePath;
  final VoidCallback onTap;

  const _GlassGridItem({
    required this.icon,
    required this.text,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<_GlassGridItem> createState() => _GlassGridItemState();
}

class _GlassGridItemState extends State<_GlassGridItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressController;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.05,
    );
    _scale = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _pressController.forward(),
      onTapUp: (_) {
        _pressController.reverse();
        widget.onTap();
      },
      onTapCancel: () => _pressController.reverse(),
      child: AnimatedBuilder(
        animation: _scale,
        builder: (context, child) {
          return Transform.scale(
            scale: _scale.value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(color: Colors.white.withOpacity(0.4)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background Image
                    Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                    ),
                    // Glass overlay
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        backgroundBlendMode: BlendMode.overlay,
                      ),
                    ),
                    // Text & Icon
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            widget.icon,
                            size: 36,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.text,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                  blurRadius: 5,
                                  color: Colors.black54,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
