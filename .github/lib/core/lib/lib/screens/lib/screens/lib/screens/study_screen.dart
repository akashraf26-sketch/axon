import 'dart:async';
import 'package:flutter/material.dart';
import '../core/theme.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  int _secondsLeft = 25 * 60;
  bool _isRunning = false;
  Timer? _timer;

  void _toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_secondsLeft > 0) {
          setState(() => _secondsLeft--);
        } else {
          _timer?.cancel();
        }
      });
    }
    setState(() => _isRunning = !_isRunning);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mins = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final secs = (_secondsLeft % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Study", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: AxonTheme.glassCardDecoration,
              child: Row(
                children: const [
                  Icon(Icons.menu_book, color: AxonTheme.cyanAccent, size: 32),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Current Session", style: TextStyle(color: AxonTheme.textMuted, fontSize: 12)),
                      Text("Physics - Chapter 3", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 220,
                  height: 220,
                  child: CircularProgressIndicator(
                    value: _secondsLeft / (25 * 60),
                    strokeWidth: 10,
                    valueColor: const AlwaysStoppedAnimation(AxonTheme.cyanAccent),
                    backgroundColor: const Color(0x1FFFFFFF),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("$mins:$secs", style: const TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: Colors.white)),
                    const Text("Focus Time", style: TextStyle(color: AxonTheme.textMuted)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              ),
              onPressed: _toggleTimer,
              child: Text(_isRunning ? "Pause Session" : "Start Study Focus", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
