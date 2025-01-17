import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3A8BB7)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Programa Layout'),
      debugShowCheckedModeBanner: false, // Removendo a faixa de debug
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildTopLayout(),
              Expanded(
                child: Center(
                  child: _buildMiddleSquare(context), // Passa o contexto
                ),
              ),
              _buildBottomLayout(),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Ação ao clicar no ícone de + (adicionar)
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopLayout() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue.shade100,
      child: Center(
        child: Text(
          'Layout Superior',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomLayout() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue.shade100,
      child: Center(
        child: Text(
          'Layout Inferior',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
        ),
      ),
    );
  }

  Widget _buildMiddleSquare(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.5; // Ajusta o tamanho do quadrado

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          'Meu Aplicativo',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
