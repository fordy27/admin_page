import 'package:admin_page2/index.dart';
import 'package:flutter/material.dart';

class OrderListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderListScreen(),
    );
  }
}

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  List<Order> orders = [
    Order(
        id: 1,
        productName: 'Product 1',
        quantity: 2,
        totalPrice: 100,
        status: OrderStatus.completed),
    Order(
        id: 2,
        productName: 'Product 2',
        quantity: 1,
        totalPrice: 50,
        status: OrderStatus.cancelled),
    Order(
        id: 3,
        productName: 'Product 3',
        quantity: 3,
        totalPrice: 150,
        status: OrderStatus.shippedOut),
    // Add more orders here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Orders'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
          },
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Order #${orders[index].id.toString()}'),
            subtitle: Text('Product: ${orders[index].productName}\n'
                'Quantity: ${orders[index].quantity.toString()}\n'
                'Total Price: \$${orders[index].totalPrice.toString()}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildStatusButton(orders[index], OrderStatus.completed),
                _buildStatusButton(orders[index], OrderStatus.cancelled),
                _buildStatusButton(orders[index], OrderStatus.shippedOut),
              ],
            ),
            onTap: () {
              // Implement action when tapping on an order
            },
          );
        },
      ),
    );
  }

  Widget _buildStatusButton(Order order, OrderStatus status) {
    Color buttonColor = const Color.fromARGB(255, 4, 2, 2);
    String buttonText = '';
    bool isDisabled = false;

    switch (status) {
      case OrderStatus.completed:
        buttonText = 'Completed';
        buttonColor = order.status == status ? Colors.green : buttonColor;
        isDisabled = order.status == status;
        break;
      case OrderStatus.cancelled:
        buttonText = 'Cancelled';
        buttonColor = order.status == status ? Colors.red : buttonColor;
        isDisabled = order.status == status;
        break;
      case OrderStatus.shippedOut:
        buttonText = 'Shipped Out';
        buttonColor = order.status == status ? Colors.blue : buttonColor;
        isDisabled = order.status == status;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: isDisabled
            ? null
            : () {
                setState(() {
                  order.status = status;
                });
              },
        child: Text(buttonText),
        style: ElevatedButton.styleFrom(primary: buttonColor),
      ),
    );
  }
}

enum OrderStatus { completed, cancelled, shippedOut }

class Order {
  final int id;
  final String productName;
  final int quantity;
  final double totalPrice;
  OrderStatus status;

  Order({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.totalPrice,
    required this.status,
  });
}
