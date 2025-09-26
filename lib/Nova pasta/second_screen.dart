import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de caminhos das imagens locais
    final List<String> images = [
      'assets/aladim.jpg',
      'assets/ari.jpg',
      'assets/belafera.jpg',
      'assets/enrolados.jpg',
      'assets/merida.jpg',
      'assets/moana.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tela'), // Título da AppBar
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0), // Espaçamento ao redor do grid
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de colunas na grade
          crossAxisSpacing: 10.0, // Espaçamento entre as colunas
          mainAxisSpacing: 10.0, // Espaçamento entre as linhas
          childAspectRatio: 0.7, // Proporção adequada para imagens
        ),
        itemCount: images.length, // Número de imagens na lista
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
