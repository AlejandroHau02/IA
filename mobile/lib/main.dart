import 'package:flutter/material.dart';
import 'shared/theme/app_theme.dart';
import 'features/onboarding/presentation/screens/welcome_screen.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const PersonalEvolutionApp());
}

class PersonalEvolutionApp extends StatelessWidget {
  const PersonalEvolutionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Evolution',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const WelcomeScreen(),
    );
  }
}
