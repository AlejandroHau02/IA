import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();


  final ApiService _apiService = ApiService(); // Instancia de la API

  bool _isLoading = false; // para saber si esta cargando

  // Funcion asincrona para llamar al cerebro
  Future<void> _analyzeEmotion() async {
    if (_controller.text.isEmpty) return;

    setState(() => _isLoading = true); // Bloqueamos boton y mostramos carga

    try {
      final result = await _apiService.analyzeEmotion(_controller.text);

      // Solo imprimir el resultado en consola por ahora
      print("Resultado de la IA: $result");

      // Y mostramos un mensaje rapido en pantalla
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Emoción: ${result['emotion']}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() => _isLoading = false); // Termina la carga
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "¿Cómo te sientes ahora?",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: Colors.white70,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Escribe aquí libremente...",
                hintStyle: TextStyle(color: Colors.white24),
                filled: true,
                fillColor: Colors.white.withOpacity(0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(20),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isLoading ? null : _analyzeEmotion, // sic arga, deshabilita
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00796B),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                ? const SizedBox( // spinner pequeño si carga
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                )
              : const Text( // Texto nromal si no carga
                  "Analizar",
                  style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}