import 'package:admin_page2/items.dart';
import 'package:admin_page2/logout.dart';
import 'package:admin_page2/view_orders.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<double> monthlySalesData = [
    4500,
    5200,
    6000,
    4800,
    7000,
    5500,
    6800,
    7200,
    6500,
    8000,
    10000,
    9000,
    8900
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/image/cartel.jpg',
                width: 60,
                height: 60,
              ),
            ),
            Text('Dashboard'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserInfo(),
            const SizedBox(height: 20),
            MonthlySalesGraph(
              monthlySalesData: monthlySalesData,
            ),
          ],
        ),
      ),
      drawer: myDrawer(context), // Pass the context to myDrawer function
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Name: Jeford Glenn'),
            Text('Email: drofejl25@gmail.com'),
            Text('Role: Admin'),
          ],
        ),
      ),
    );
  }
}

class MonthlySalesGraph extends StatelessWidget {
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final List<double> monthlySalesData;

  MonthlySalesGraph({
    required this.monthlySalesData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Sales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(
                        monthlySalesData.length,
                        (index) => FlSpot(
                            (index + 1).toDouble(), monthlySalesData[index]),
                      ),
                      isCurved: true,
                      colors: [Color.fromARGB(255, 250, 41, 41)],
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) => const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      getTitles: (value) {
                        int intValue = value.toInt();
                        if (intValue >= 1 && intValue <= months.length) {
                          return months[intValue - 1];
                        }
                        return '';
                      },
                      margin: 8,
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) => const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      getTitles: (value) {
                        return '${value.toInt()}';
                      },
                      margin: 8,
                    ),
                  ),
                  minX: 1,
                  maxX: (monthlySalesData.length - 1).toDouble(),
                  minY: 0,
                  maxY: 12000,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget myDrawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: Color.fromARGB(255, 248, 244, 244),
      child: ListView(
        children: [
          DrawerHeader(
            child: Icon(Icons.admin_panel_settings_rounded),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("DASHBOARD"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopify),
            title: Text("ORDERS"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrderListApp()));
              // Navigate to the message screen
            },
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("ITEMS"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClothingStorePage()));
              // Navigate to the settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("LOGOUT"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LogoutPage()));
              // Perform logout action here
            },
          ),
        ],
      ),
    ),
  );
}
