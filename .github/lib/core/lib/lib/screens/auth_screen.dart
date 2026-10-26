import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'main_navigation_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.2),
            radius: 0.9,
            colors: [Color(0xFF1E3A8A), AxonTheme.background],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AxonTheme.cyanAccent.withOpacity(0.4),
                        blurRadius: 30,
                        spreadRadius: 4,
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text('AX', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Axon',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your Life. Organized. Smarter.',
                  style: TextStyle(color: AxonTheme.textMuted, fontSize: 16),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                  ),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
                  ),
                  icon: const Icon(Icons.g_mobiledata, size: 30, color: Colors.white),
                  label: const Text('Continue with Google', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56),
                    side: const BorderSide(color: Color(0x33FFFFFF)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                  ),
                  onPressed: () {},
                  child: const Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Already have an account? ", style: TextStyle(color: AxonTheme.textMuted)),
                    Text("Log In", style: TextStyle(color: AxonTheme.cyanAccent, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
