import 'package:canbus/canbus_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // const MyApp()
    ChangeNotifierProvider(
      create: (context) => CanbusProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Home Page1 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final canbusProvider = context.watch<CanbusProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<CanbusProvider>(
        builder: (context, canbusProvider, child) {
          return _buildBody(canbusProvider);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          canbusProvider.fetchCanbusData(); // Fetching CAN Data
        },
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop, 
    );
    
  }

  Widget _buildBody(CanbusProvider canbusProvider) {
    if (canbusProvider.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (canbusProvider.error.isNotEmpty) {
      return Center(child: Text(canbusProvider.error));
    } else if (canbusProvider.data.isEmpty) {
      return Center(child: Text('No data found. Tap the button to load data.'));
    } else {
      final data = canbusProvider.data;
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final frame = data[index];
          return Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(10),
            color: Colors.blue,
            child: Center(
              child: Text(
                frame.pgn,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        },
      );
    }
  }
}
