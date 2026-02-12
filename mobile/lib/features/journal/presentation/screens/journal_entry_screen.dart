import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/daily_log.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/services/service_locator.dart';
import '../bloc/journal_bloc.dart';
import '../../domain/services/sentiment_service.dart';
import 'dart:async';

// TODO: Import Bloc

class JournalEntryScreen extends StatefulWidget {
  const JournalEntryScreen({super.key});

  @override
  State<JournalEntryScreen> createState() => _JournalEntryScreenState();
}

class _JournalEntryScreenState extends State<JournalEntryScreen> {
  double _energyLevel = 5.0;
  double _stressLevel = 5.0;
  final TextEditingController _noteController = TextEditingController();
  Timer? _debounce;

  // Obtener servicio
  final _sentimentService = getIt<SentimentService>();

  @override
  void initState(){
    super.initState();
    // Escuchar cambios en el texto
    _noteController.addListener(_onTextChanged);
  }

  @override
  void dispose(){
    _noteController.removeListener(_onTextChanged);
    _debounce?.cancel();
    _noteController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    // Cancelar el timer anterior si se sigue escribiendo
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Esperar 500ms para analizar
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final text = _noteController.text;
      final analysis = _sentimentService.analyzeText(text);

      if (analysis != null) {
        setState(() {
          // Sólo actualizar si el análisis encontró algo
          if (analysis.containsKey('energy')) {
            _energyLevel = analysis['energy']!;
          }
          if (analysis.containsKey('stress')) {
            _stressLevel = analysis['stress']!;
          }
        });

        // Feedback visual sutil
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Niveles ajustados por IA'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context) => getIt<JournalBloc>(), // Inyectamos el Bloc
      child: BlocConsumer<JournalBloc, JournalState>(
        listener: (context, state) {
          if (state is JournalSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('¡Diario guardado!')),
            );
            Navigator.of(context).pop(); // Volver atrás (Standard Nav)
          }
          if (state is JournalError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          if (state is JournalLoading) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
            return Scaffold(
              appBar: AppBar(
                title: const Text('Registro Diario'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      final log = DailyLog(
                        id: const Uuid().v4(),
                        date: DateTime.now(),
                        energyLevel: _energyLevel.round(),
                        stressLevel: _stressLevel.round(),
                        note: _noteController.text,
                      );
                      context.read<JournalBloc>().add(SaveDailyLog(log));
                    },
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSliderSection(
                      label: 'Nivel de Energía',
                      value: _energyLevel,
                      color: Colors.amber,
                      onChanged: (v) => setState(() => _energyLevel = v),
                    ),
                    const SizedBox(height: 24),
                    _buildSliderSection(
                      label: 'Nivel de Estrés',
                      value: _stressLevel,
                      color: Colors.redAccent,
                      onChanged: (v) => setState(() => _stressLevel = v),
                    ),
                    const SizedBox(height: 24),
                    const Text('Notas (Contexto)', style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _noteController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: '¿Qué pasó hoy? (Esto ayuda a la IA a entender el contexto)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
  }

  Widget _buildSliderSection({
    required String label,
    required double value,
    required Color color,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 18)),
            Text('${value.round()}/10', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
        Slider(
          value: value,
          min: 1,
          max: 10,
          divisions: 9,
          activeColor: color,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
