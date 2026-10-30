import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Vasos de Agua',
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      home: const PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int _vasos = 0;

  void _agregarVaso() {
    setState(() {
      _vasos++;
    });
  }

  void _mostrarDialogoReinicio() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Reiniciar contador?'),
        content: const Text('Se borrarán los vasos de agua registrados hoy.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                _vasos = 0;
              });
              Navigator.pop(context);
            },
            child: const Text('Sí, reiniciar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Mi Hidratación Diaria'),
        leading: const Icon(Icons.water_drop),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_drink, size: 90, color: Colors.teal),
            const SizedBox(height: 16),
            const Text(
              'Vasos de agua bebidos hoy:',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '$_vasos',
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _vasos >= 8
                  ? '¡Meta cumplida! 🎉'
                  : 'Meta: 8 vasos al día',
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: _mostrarDialogoReinicio,
              icon: const Icon(Icons.refresh),
              label: const Text('Reiniciar'),
            ),

            TextButton(
              onPressed: () {
                debugPrint('Llevas $_vasos vasos de agua hoy.');
              },
              child: const Text('Ver progreso en consola'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _agregarVaso,
        icon: const Icon(Icons.add),
        label: const Text('Agregar vaso'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
    );
  }
}