import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/theme.dart';

class BlockScreen extends StatefulWidget {
  const BlockScreen({super.key});

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  static const platform = MethodChannel('com.axon.productivity/blocker');

  final Map<String, bool> _apps = {
    "com.instagram.android": true,
    "com.google.android.youtube": true,
    "com.zhiliaoapp.musically": true,
  };

  void _syncWithNative() async {
    final active = _apps.entries.where((e) => e.value).map((e) => e.key).toList();
    await platform.invokeMethod('updateBlockedPackages', {'packages': active});
  }

  void _requestPermissions() async {
    await platform.invokeMethod('requestOverlayPermission');
    await platform.invokeMethod('requestAccessibilityPermission');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Block Apps"), backgroundColor: Colors.transparent),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E293B)),
            onPressed: _requestPermissions,
            icon: const Icon(Icons.security, color: AxonTheme.cyanAccent),
            label: const Text("Enable Permissions (Overlay & Service)"),
          ),
          const SizedBox(height: 20),
          ..._apps.keys.map((pkg) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: AxonTheme.glassCardDecoration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(pkg.split('.').last.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    Switch(
                      value: _apps[pkg]!,
                      activeColor: AxonTheme.cyanAccent,
                      onChanged: (val) {
                        setState(() => _apps[pkg] = val);
                        _syncWithNative();
                      },
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
