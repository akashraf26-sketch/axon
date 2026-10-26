import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AxonApp());
}

class AxonApp extends StatelessWidget {
  const AxonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Axon',
      debugShowCheckedModeBanner: false,
      theme: AxonTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
