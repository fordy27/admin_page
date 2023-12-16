import 'package:admin_page2/add_stock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClothingStorePage(),
    );
  }
}

class ClothingStorePage extends StatefulWidget {
  @override
  _ClothingStorePageState createState() => _ClothingStorePageState();
}

class _ClothingStorePageState extends State<ClothingStorePage> {
  final List<Map<String, dynamic>> clothingItems = [];

  void deleteSelectedItems() {
    setState(() {
      clothingItems.removeWhere((item) => item['selected']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothing Store Inventory'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddStockPage(),
                ),
              ).then((newStock) {
                if (newStock != null) {
                  setState(() {
                    clothingItems.add(newStock);
                  });
                }
              });
            },
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 10), // Spacer between buttons
          FloatingActionButton(
            onPressed: () {
              deleteSelectedItems();
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: .9,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: clothingItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = clothingItems[index];

                    return Card(
                      color: item['selected']
                          ? Colors.lightBlueAccent
                          : Colors.white,
                      child: ListTile(
                        title: Text(
                          item['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                item['selected'] ? Colors.white : Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'Stock: ${item['stock']} - \$${item['price']}',
                          style: TextStyle(
                            color:
                                item['selected'] ? Colors.white : Colors.black,
                          ),
                        ),
                        trailing: Checkbox(
                          value: item['selected'],
                          onChanged: (bool? value) {
                            setState(() {
                              item['selected'] = value ?? false;
                            });
                          },
                          activeColor: Colors.lightBlueAccent,
                        ),
                        onTap: () {
                          setState(() {
                            item['selected'] = !item['selected'];
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
