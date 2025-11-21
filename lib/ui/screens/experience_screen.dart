import 'dart:math';
import 'package:flutter/material.dart';
import '../../ui/layout/main_layout.dart';
import '../../../data/dummy_data.dart';
import '../../ui/widgets/experience_tile.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final experiences = DummyData.experiences;

    return MainLayout(
      title: "Experience",
      child: Stack(
        children: [
          /// Light pastel background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF8FBFF), Color(0xFFEFF6FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          /// Floating pastel shapes
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                painter: LightShapesPainter(_controller.value),
                child: const SizedBox.expand(),
              );
            },
          ),

          /// Main content
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              /// Title with accent underline
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Professional Experience",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 60,
                    margin: const EdgeInsets.only(top: 4, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),

              /// Experience list
              ...experiences.asMap().entries.map((entry) {
                final index = entry.key;
                final exp = entry.value;

                return TweenAnimationBuilder(
                  duration: Duration(milliseconds: 400 + (index * 150)),
                  tween: Tween<double>(begin: 50, end: 0),
                  builder: (context, offset, child) {
                    return Opacity(
                      opacity: offset == 0 ? 1 : 0,
                      child: Transform.translate(
                        offset: Offset(0, offset),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: ExperienceTile(experience: exp),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

/// Painter for light background floating shapes
class LightShapesPainter extends CustomPainter {
  final double progress;
  LightShapesPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blueAccent.withOpacity(0.05);
    final random = Random(1);

    for (int i = 0; i < 5; i++) {
      final dx = size.width * (0.2 + random.nextDouble() * 0.6);
      final dy = size.height * ((progress + i * 0.2) % 1);
      final radius = 40.0 + random.nextDouble() * 30;
      canvas.drawCircle(Offset(dx, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
