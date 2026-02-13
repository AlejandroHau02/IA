import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../journal/presentation/bloc/journal_bloc.dart';

class JournalListScreen extends StatelessWidget {
    const JournalListScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            // Usamos un color de fondo para distinguir
            backgroundColor: Colors.black12,
            body: BlocBuilder<JournalBloc, JournalState>(
                builder: (context, state) {
                    // 1. Cargando, mostrar rueda
                    if (state is JournalLoading) {
                        return const Center(child:CircularProgressIndicator());
                    }

                    // 2. Si ya cargó los datos
                    if (state is JournalHistoryLoaded) {
                        if (state.logs.isEmpty) {
                            return const Center(
                                child:Text('No hay entradas aún', style: TextStyle(color: Colors.white)));
                        }
                        // Mostrar la lista real
                        return ListView.builder(
                            itemCount: state.logs.length,
                            itemBuilder: (context, index) {
                                final log = state.logs[index];
                                return ListTile(
                                    title: Text(log.note ?? 'Sin texto', style: const TextStyle(color: Colors.white)),
                                    subtitle: Text(log.date.toString(), style: const TextStyle(color: Colors.grey)),
                                    leading: CircleAvatar(child: Text(log.energyLevel.toString())),
                                );
                            },
                        );
                    }

                    // 3- Estado inicial o error
                    return const Center(
                        child: Text('Esperando datos...', style: TextStyle(color: Colors.white)));
                },
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