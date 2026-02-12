import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/daily_log.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro Diario'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // TODO: Save logic via Bloc
              // final log = DailyLog(
              //   id: const Uuid().v4(),
              //   date: DateTime.now(),
              //   energyLevel: _energyLevel.round(),
              //   stressLevel: _stressLevel.round(),
              //   note: _noteController.text,
              // );
              // context.read<JournalBloc>().add(SaveLogEvent(log));
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
