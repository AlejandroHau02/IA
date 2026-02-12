import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JournalListScreen extends StatelessWidget {
    const JournalListScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            // Usamos un color de fondo para distinguir
            backgroundColor: Colors.black12,
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Icon(Icons.book, size: 80, color: Colors.grey),
                        const SizedBox(height: 20),
                        const Text(
                            'Tu historial',
                            style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                            'Aquí verás tus registros diarios',
                            style: TextStyle(fontSize: 14, color: Colors.white30),
                        ),
                    ],
                ),
            ),
            // Botón flotante para agregar una nueva entrada
            floatingActionButton:
            FloatingActionButton.extended(
                onPressed: () {
                    // Navegación a la pantalla de entrada
                    context.push('/journal/entry');
                },
                label: const Text('Nuevo Registro'),
                icon: const Icon(Icons.edit),
            ),
        );
    }
}