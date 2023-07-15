import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const Stonks());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

class Stonks extends StatelessWidget {
  const Stonks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Market',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Market'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 5),
                      FlSpot(1, 5.1),
                      FlSpot(2, 5.3),
                      FlSpot(3, 5.2),
                      FlSpot(4, 5.5),
                      FlSpot(5, 5.4),
                      FlSpot(6, 5.6),
                      FlSpot(7, 5.7),
                    ],
                    isCurved: true,
                    colors: [Colors.blue],
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  const StockPriceCard(
                    symbol: 'AAPL',
                    price: '148.56',
                    change: '+1.23',
                    percentageChange: '+0.83%',
                  ),
                  const StockPriceCard(
                    symbol: 'GOOG',
                    price: '2739.41',
                    change: '-4.56',
                    percentageChange: '-0.21%',
                  ),
                  const StockPriceCard(
                    symbol: 'AMZN',
                    price: '3602.25',
                    change: '+10.20',
                    percentageChange: '+0.28%',
                  ),
                  const StockPriceCard(
                    symbol: 'MSFT',
                    price: '289.67',
                    change: '-2.30',
                    percentageChange: '-0.79%',
                  ),
                  const StockPriceCard(
                    symbol: 'TSLA',
                    price: '650.60',
                    change: '+8.42',
                    percentageChange: '+1.31%',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StockPriceCard extends StatelessWidget {
  final String symbol;
  final String price;
  final String change;
  final String percentageChange;

  const StockPriceCard({
    Key? key,
    required this.symbol,
    required this.price,
    required this.change,
    required this.percentageChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  symbol,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  change,
                  style: TextStyle(
                    fontSize: 14,
                    color: change.startsWith('-') ? Colors.red : Colors.green,
                  ),
                ),
                Text(
                  percentageChange,
                  style: TextStyle(
                    fontSize: 14,
                    color: change.startsWith('-') ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
