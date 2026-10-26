import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../core/theme.dart';
import 'study_screen.dart';
import 'daily_habits_screen.dart';
import 'gym_screen.dart';
import 'block_screen.dart';
import 'profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    StudyScreen(),
    DailyHabitsScreen(),
    GymScreen(),
    BlockScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A).withOpacity(0.9),
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, LucideIcons.calendar, "Study"),
            _buildNavItem(1, LucideIcons.calendarCheck, "Daily"),
            _buildNavItem(2, LucideIcons.dumbbell, "Gym"),
            _buildNavItem(3, LucideIcons.ban, "Block"),
            _buildNavItem(4, LucideIcons.user, "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color(0xFF2563EB),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? Colors.white : AxonTheme.textMuted, size: 20),
            const SizedBox(height: 3),
            Text(label, style: TextStyle(color: isSelected ? Colors.white : AxonTheme.textMuted, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
