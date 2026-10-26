import 'package:flutter/material.dart';
import '../core/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), backgroundColor: Colors.transparent),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: AxonTheme.glassCardDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _StatItem(label: "Age", value: "27"),
                _StatItem(label: "Height", value: "170 cm"),
                _StatItem(label: "Weight", value: "52 kg"),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text("Preferences", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Container(
            decoration: AxonTheme.glassCardDecoration,
            child: Column(
              children: const [
                ListTile(title: Text("Theme"), trailing: Text("Dark (Default)", style: TextStyle(color: AxonTheme.textMuted))),
                Divider(color: AxonTheme.borderStroke),
                ListTile(title: Text("Language"), trailing: Text("English", style: TextStyle(color: AxonTheme.textMuted))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: AxonTheme.textMuted, fontSize: 13)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
