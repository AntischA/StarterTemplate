import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starter App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(title: Text('Starter ')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flutter_dash, size: 64, color: Colors.teal),
              SizedBox(height: 16),
              Text(
                'Pozdrav iz novog MOŠ MISLIT ŠTO JE NOV  !',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Drugi pozdrav Flutter !',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  print('Kliknuto!');
                },
                child: Text('Kliknuti moraš mene '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
