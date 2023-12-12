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
      appBar: myAppBar,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserInfo(),
            SizedBox(height: 20),
            MonthlySalesGraph(
              monthlySalesData: monthlySalesData,
            ),
          ],
        ),
      ),
      drawer: myDrawer, // Add drawer here
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
            Text('Name: John Doe'),
            Text('Email: john.doe@example.com'),
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
                      colors: [Colors.blue],
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
                      // Set the interval to display whole numbers
                      getTextStyles: (context, value) => const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      getTitles: (value) {
                        return '${value.toInt()}'; // Display the whole numbers as strings
                      },
                      margin: 8,
                    ),
                  ),
                  minX: 1, // Adjust the minimum x value to 0
                  maxX: (monthlySalesData.length - 1)
                      .toDouble(), // Set the maximum x value
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

var myAppBar = AppBar(
  title: Text('Dashboard'),
);

var myDrawer = Drawer(
  child: ListView(
    children: [
      DrawerHeader(child: Text("A D M I N")),
      ListTile(
        leading: Icon(Icons.home),
        title: Text("DASHBOARD"),
        onTap: () {
          // Navigator.pushNamed(context, '/dashboard');
          // Navigate to the dashboard screen
        },
      ),
      ListTile(
        leading: Icon(Icons.chat),
        title: Text("MESSAGE"),
        onTap: () {
          // Navigator.pushNamed(context, '/message');
          // Navigate to the message screen
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text("SETTINGS"),
        onTap: () {
          // Navigator.pushNamed(context, '/settings');
          // Navigate to the settings screen
        },
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("LOGOUT"),
        onTap: () {
          // Perform logout action here
          // For example: Clear authentication status or user data
          // Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        },
      ),
    ],
  ),
);
