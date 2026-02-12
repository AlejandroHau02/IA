import 'package:go_router/go_router.dart';
import '../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../features/onboarding/presentation/screens/welcome_screen.dart';
import '../features/journal/presentation/screens/journal_entry_screen.dart';

// 1. Definimos la configuración del Router
final appRouter = GoRouter(
    // 2. Ruta inicial: Pantalla que se muestra al abrir la app
    // Dashboard por ahora
    initialLocation: '/dashboard',

    routes: [
        // 3. Ruta para la pantalla de bienvenida
        GoRoute(
            path: '/',
            builder: (context, state) => const WelcomeScreen(),
        ),

        // 4. Ruta para el dashboard
        GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
        ),

        // Ruta para crear una nueva entrada
        GoRoute(
            path: '/journal/entry',
            builder: (context, state) => const JournalEntryScreen(),
        ),
    ],
);