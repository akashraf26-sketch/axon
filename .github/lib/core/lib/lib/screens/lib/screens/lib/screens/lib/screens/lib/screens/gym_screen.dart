import 'package:flutter/material.dart';
import '../core/theme.dart';

class GymScreen extends StatelessWidget {
  const GymScreen({super.key});

  void _triggerPaywall(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0F172A),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      builder: (_) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("👑 Unlock Custom Workout Engine", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 12),
            const Text("Get full personalized calisthenics, gym splits, and target muscle guides.", textAlign: TextAlign.center, style: TextStyle(color: AxonTheme.textMuted)),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AxonTheme.neonGreen, minimumSize: const Size(double.infinity, 50)),
              onPressed: () => Navigator.pop(context),
              child: const Text("Subscribe ₹499/mo", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gym & Workouts"),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: AxonTheme.glassCardDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Stronger Every Day", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text("Premium 👑", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text("Build your best physique.", style: TextStyle(color: AxonTheme.textMuted)),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2563EB)),
                  onPressed: () => _triggerPaywall(context),
                  child: const Text("Unlock Custom Workout Plan", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text("Workout Modes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: AxonTheme.glassCardDecoration,
                  child: const Column(children: [Icon(Icons.fitness_center, color: AxonTheme.cyanAccent), SizedBox(height: 8), Text("Gym Routine")]),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: AxonTheme.glassCardDecoration,
                  child: const Column(children: [Icon(Icons.accessibility_new, color: AxonTheme.neonGreen), SizedBox(height: 8), Text("Calisthenics")]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
