import 'package:flutter/material.dart';
import '../core/theme.dart';

class DailyHabitsScreen extends StatefulWidget {
  const DailyHabitsScreen({super.key});

  @override
  State<DailyHabitsScreen> createState() => _DailyHabitsScreenState();
}

class _DailyHabitsScreenState extends State<DailyHabitsScreen> {
  final List<Map<String, dynamic>> habits = [
    {"title": "Drink 8 Glasses of Water", "done": true},
    {"title": "Workout / Exercise", "done": true},
    {"title": "Read a Book", "done": false},
    {"title": "Meditate", "done": true},
    {"title": "Healthy Eating", "done": true},
    {"title": "No Social Media", "done": false},
  ];

  @override
  Widget build(BuildContext context) {
    int completed = habits.where((h) => h["done"] == true).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Habits", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: AxonTheme.glassCardDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$completed/${habits.length} Completed", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    const Text("Consistency builds better you.", style: TextStyle(color: AxonTheme.textMuted, fontSize: 13)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(color: const Color(0x33FF9900), borderRadius: BorderRadius.circular(16)),
                  child: const Row(
                    children: [
                      Icon(Icons.local_fire_department, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text("7 Streak", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          ...habits.map((h) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: AxonTheme.glassCardDecoration,
                child: Row(
                  children: [
                    Text(h["title"], style: const TextStyle(color: Colors.white, fontSize: 15)),
                    const Spacer(),
                    Checkbox(
                      value: h["done"],
                      activeColor: AxonTheme.neonGreen,
                      checkColor: Colors.black,
                      onChanged: (val) {
                        setState(() => h["done"] = val);
                      },
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
