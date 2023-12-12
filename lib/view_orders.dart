import 'package:flutter/material.dart';

class OrderListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderListScreen(),
    );
  }
}

class OrderListScreen extends StatelessWidget {
  // Simulated list of orders for a customer
  final List<Order> orders = [
    Order(id: 1, productName: 'Product 1', quantity: 2, totalPrice: 100),
    Order(id: 2, productName: 'Product 2', quantity: 1, totalPrice: 50),
    Order(id: 3, productName: 'Product 3', quantity: 3, totalPrice: 150),
    // Add more orders here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Orders')),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Order #${orders[index].id.toString()}'),
            subtitle: Text('Product: ${orders[index].productName}\n'
                'Quantity: ${orders[index].quantity.toString()}\n'
                'Total Price: \$${orders[index].totalPrice.toString()}'),
            // You can add more information or actions here
            onTap: () {
              // Implement action when tapping on an order
              // For instance, navigate to a detailed order view
              // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailScreen(order: orders[index])));
            },
          );
        },
      ),
    );
  }
}

class Order {
  final int id;
  final String productName;
  final int quantity;
  final double totalPrice;

  Order(
      {required this.id,
      required this.productName,
      required this.quantity,
      required this.totalPrice});
}
