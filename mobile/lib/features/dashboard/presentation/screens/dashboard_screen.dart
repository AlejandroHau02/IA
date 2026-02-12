import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'journal_list_screen.dart';

// 1. Usamos StatefulWidget porque esta pantalla tiene "Memoria" (Estado).
// Necesita recordar qué pestaña está seleccionada (0, 1, 2, o 3).
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // 2. Esta variable (_selectedIndex) es la "Memoria".
  // Empieza en 0 (la primera pestaña).
  int _selectedIndex = 0;

  // 3. Esta lista contiene las Vistas (Screens) que se mostrarán en el cuerpo.
  // Por ahora son solo textos (Placeholders), luego pondremos tus pantallas reales.
  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Inicio', style: TextStyle(fontSize: 20))),     // Índice 0
    Center(child: const JournalListScreen()),     // Índice 1
    Center(child: Text('Acciones', style: TextStyle(fontSize: 20))),   // Índice 2
    Center(child: Text('Análisis', style: TextStyle(fontSize: 20))),   // Índice 3
  ];

  // 4. Esta función se llama cuando tocas un botón de la barra inferior.
  void _onItemTapped(int index) {
    // setState es MÁGICO: Le dice a Flutter "¡Algo cambió! Por favor redibuja la pantalla".
    // Sin setState, la variable cambiaría, pero la pantalla seguiría igual.
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 5. Scaffold es el "Andamio" o esqueleto estándar de una pantalla (Barra arriba, cuerpo, barra abajo).
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Evolution'),
      ),
      // 6. El body muestra el widget de la lista que corresponde al índice actual.
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // 7. NavigationBar es el componente visual de la barra inferior.
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex, // Le decimos cuál debe estar iluminado.
        onDestinationSelected: _onItemTapped, // Qué hacer cuando se toca uno.
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.book_outlined),
            selectedIcon: Icon(Icons.book),
            label: 'Diario',
          ),
          NavigationDestination(
            icon: Icon(Icons.flag_outlined),
            selectedIcon: Icon(Icons.flag),
            label: 'Objetivos',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights),
            label: 'Análisis',
          ),
        ],
      ),
    );
  }
}
