import 'dart:math';
import 'package:flutter/material.dart';
import '../../ui/layout/main_layout.dart';
import '../../../data/dummy_data.dart';

class HobbiesScreen extends StatefulWidget {
  const HobbiesScreen({super.key});

  @override
  State<HobbiesScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen>
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
    final hobbies = DummyData.hobbies;

    return MainLayout(
      title: "Hobbies",
      child: Stack(
        children: [
          /// Light gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF8FBFF), Color(0xFFEFF6FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          /// Floating pastel shapes for depth
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                painter: LightHobbyShapesPainter(_controller.value),
                child: const SizedBox.expand(),
              );
            },
          ),

          /// Content
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              /// Title + underline + description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Things I Enjoy",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 60,
                    margin: const EdgeInsets.only(top: 4, bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Text(
                    "A peek into my favorite activities and passions.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

              /// Hobby cards
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: hobbies.asMap().entries.map((entry) {
                  final index = entry.key;
                  final hobby = entry.value;

                  return TweenAnimationBuilder(
                    duration:
                    Duration(milliseconds: 400 + (index * 150)),
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
                      width: MediaQuery.of(context).size.width / 2 - 24,
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
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// Hobby icon image
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueAccent.withOpacity(0.1),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              hobby.iconPath,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            hobby.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Painter for subtle floating shapes
class LightHobbyShapesPainter extends CustomPainter {
  final double progress;
  LightHobbyShapesPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      Colors.blueAccent.withOpacity(0.05),
      Colors.purpleAccent.withOpacity(0.05),
      Colors.cyan.withOpacity(0.05),
    ];
    final random = Random(2);

    for (int i = 0; i < 6; i++) {
      final paint = Paint()..color = colors[i % colors.length];
      final dx = size.width * (0.1 + random.nextDouble() * 0.8);
      final dy = size.height * ((progress + i * 0.15) % 1);
      final radius = 30.0 + random.nextDouble() * 20;
      canvas.drawCircle(Offset(dx, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
