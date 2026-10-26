import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme.dart';
import 'screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('axon_settings');
  await Hive.openBox('axon_habits');

  runApp(const AxonApp());
}

class AxonApp extends StatelessWidget {
  const AxonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AXON',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AxonTheme.background,
        primaryColor: AxonTheme.cyanAccent,
      ),
      home: const AuthScreen(),
    );
  }
}
