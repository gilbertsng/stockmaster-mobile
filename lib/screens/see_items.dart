import 'package:flutter/material.dart';
import 'package:stockmaster/models/item.dart'; 

class ProductListPage extends StatelessWidget {
  final List<Item> items;

  ProductListPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
              child: Text(
                'Daftar Item',
              ),
            ),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(items[index].name),
              subtitle: Text('Amount: ${items[index].amount}\nDescription: ${items[index].description}'),
            ),
          );
        },
      ),
    );
  }
}