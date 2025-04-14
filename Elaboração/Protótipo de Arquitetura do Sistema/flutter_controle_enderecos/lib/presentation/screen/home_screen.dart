import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> features = ["Restaurantes", "Bebidas", "Mercados", "Farmácias"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _body(),
    ));
  }

  Widget _body() {
    return _createGridView();
  }

  Widget _createGridView() {
    return GridView.builder(
      gridDelegate: _createDelegateGrid(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: _createGridTile(features[index]),
        );
      },
    );
  }

  GridTile _createGridTile(String title) {
    return GridTile(
        header: GridTileBar(
            title: Text(title,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold))),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Image.asset("assets/placeholder.png"),
              ),
            ],
          ),
        ));
  }

  SliverGridDelegate _createDelegateGrid() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8);
  }
}
