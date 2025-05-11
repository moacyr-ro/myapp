import 'package:flutter/material.dart';

void main() {
  runApp(const LojaFerramentasApp());
}

class LojaFerramentasApp extends StatelessWidget {
  const LojaFerramentasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja de Ferramentas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const produtos = [
    {'nome': 'Martelo', 'preco': 'R\$ 45,00', 'imagem': Icons.construction},
    {'nome': 'Chave de Fenda', 'preco': 'R\$ 25,00', 'imagem': Icons.build},
    {'nome': 'Alicate', 'preco': 'R\$ 30,00', 'imagem': Icons.handyman},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja de Ferramentas do Moa'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int colunas = constraints.maxWidth < 600 ? 1 : 3;
          return GridView.count(
            crossAxisCount: colunas,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: produtos.map((produto) {
              return Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(produto['imagem'] as IconData, size: 50, color: Colors.green),
                      const SizedBox(height: 10),
                      Text(produto['nome'] as String, style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 5),
                      Text(produto['preco'] as String, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Você comprou ${produto['nome']}!')),
                          );
                        },
                        child: const Text('Comprar'),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}