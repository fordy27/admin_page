import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClothingStorePage(),
    );
  }
}

class ClothingStorePage extends StatelessWidget {
  // Sample list of items with their names and available stock quantities
  final List<Map<String, dynamic>> clothingItems = [
    {"name": "T-Shirt", "stock": 20},
    {"name": "Jeans", "stock": 15},
    {"name": "Dress", "stock": 10},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing Store Inventory'),
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = clothingItems[index];
          return ListTile(
            title: Text(item['name']),
            subtitle: Text('Stock: ${item['stock']}'),
            // You can add more details or actions for each item here
            onTap: () {
              // Handle item tap action, e.g., navigate to item details
            },
          );
        },
      ),
    );
  }
}
