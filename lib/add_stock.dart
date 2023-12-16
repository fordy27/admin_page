import 'package:flutter/material.dart';

class AddStockPage extends StatefulWidget {
  const AddStockPage({super.key});

  @override
  State<AddStockPage> createState() => _AddStockPageState();
}

class _AddStockPageState extends State<AddStockPage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  void submitForm() {
    // Get values from the text fields
    final String productName = productNameController.text;
    final int stock = int.tryParse(stockController.text) ?? 0;
    final double price = double.tryParse(priceController.text) ?? 0.0;

    // Create a Map containing the new stock details
    final Map<String, dynamic> newStock = {
      "name": productName,
      "stock": stock,
      "price": price,
      "selected": false,
    };

    // Navigate back to the previous screen and pass the new stock details
    Navigator.of(context).pop(newStock);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Stock Page"),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: .9,
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: productNameController,
                decoration: const InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Stock",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: submitForm,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Center(
                      child: Text("Submit"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    productNameController.dispose();
    stockController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
