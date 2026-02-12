import 'package:flutter/material.dart';

class BreathingScreen extends StatefulWidget {
    final Map<String, dynamic> data; // se recibe todo el JSON del backend

    const BreathingScreen({super.key, required this.data});

    @override
    State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen>with 
    SingleTickerProviderStateMixin {
        late AnimationController _controller;
        late Animation<double> _sizeAnimation;

        // Variables para guardar los tiempos
        late int inhaleTime;
        late int holdTime;
        late int exhaleTime;
        late Color patternColor;

        String _instruction = "Prepárate...";

        @override
        void initState(){
            super.initState();

        // 1- Extraer datos del patrón (o usar valores por defecto si falla)
        final pattern = widget.data['pattern'] ?? {};
        inhaleTime = pattern['inhale'] ?? 4;
        holdTime = pattern['hold'] ?? 7;
        exhaleTime = pattern['exhale'] ?? 8;

        // COnvertir color int a Color object (si es null, usar azul)
        int? colorInt = pattern['color'];
        patternColor = colorInt != null ? Color(colorInt) : Colors.blue;

        final totalDuration = inhaleTime + holdTime + exhaleTime;

        // 2- Configurar el controlador con la duración total
        _controller = AnimationController(
            vsync: this,
            duration: Duration(seconds: totalDuration)
        );

        // 3- Crear secuencia de animación exacta
        // Calcular los "pesos" relativos de cada fase
        _sizeAnimation = TweenSequence<double>([
            // Fase Inhalar: Crece
            TweenSequenceItem(
                tween: Tween<double>(begin: 150.0, end: 320.0)
                    .chain(CurveTween(curve: Curves.easeOut)),
                weight: inhaleTime.toDouble(),
            ),
            // Fase Retener: se mantiene (solo si holdtime > 0)
            if (holdTime > 0)
            TweenSequenceItem(
                tween: ConstantTween<double>(320.0),
                weight: holdTime.toDouble(),
            ),
            // Fas Exhalar: se contrae
            TweenSequenceItem(
                tween: Tween<double>(begin: 320.0, end: 150.0)
                    .chain(CurveTween(curve: Curves.easeIn)),
                weight: exhaleTime.toDouble(),
            ),
        ]).animate(_controller);

        // 4- Listeners para cambiar texto e instrucciones
        _controller.addListener(() {
            final t = _controller.value; // va de 0.0 a 1.0

            // Calcular en qué porcentaje del tiempo total ocurre cada cambio
            double inhalePercent = inhaleTime / totalDuration;
            double holdPercent = (inhaleTime + holdTime) / totalDuration;

            if (t <= inhalePercent) {
                _setInstruction("Inhala");
            } else if (t <= holdPercent) {
                _setInstruction("Retén");
            } else {
                _setInstruction("Exhala");
            }
        });

        // Repetir indefinidamente
        _controller.repeat();
    }

    void _setInstruction(String text) {
        if (_instruction != text) {
            setState(() => _instruction = text);
        }
    }

    @override
    void dispose() {
        _controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black, // Fondo inmersivo
            body: Stack(
                children: [
                    // Botón de salida discreto
                    Positioned(
                        top: 50,
                        left: 20,
                        child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white54),
                            onPressed: () => Navigator.pop(context),
                        ),
                    ),

                    Center(
                        child: AnimatedBuilder(
                            animation: _sizeAnimation,
                            builder: (context, child) {
                                return Container(
                                    width: _sizeAnimation.value,
                                    height: _sizeAnimation.value,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        // Gradiente radial usando el color del patrón
                                        gradient: RadialGradient(
                                            colors: [
                                                patternColor.withOpacity(0.6),
                                                patternColor.withOpacity(0.1)
                                            ],
                                            stops: const [0.5, 1.0],
                                        ),
                                        boxShadow: [
                                            BoxShadow(
                                                color: patternColor.withOpacity(0.3),
                                                blurRadius: 40,
                                                spreadRadius: 10,
                                            )
                                        ]
                                    ),
                                    child: Center(
                                        child: Text(
                                            _instruction,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                    ),
                                );
                            },
                        ),
                    ),

                    // Texto inferior con la explicación
                    Positioned(
                        bottom: 60,
                        left: 20,
                        right: 20,
                        child: Text(
                            widget.data['emotion'] ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white38, fontSize: 16),
                        ),
                    )
                ],
            ),
        );
    }
}