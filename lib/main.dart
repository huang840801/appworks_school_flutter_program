import 'package:appworks_school_flutter_program/js_interface.dart';
import 'package:flutter/material.dart';

export 'package:js/js.dart';
export 'package:node_interop/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String prime = 'MyPrime';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
            padding: const EdgeInsets.all(16),
            child: Center(
                child: Text(
              prime,
              style: const TextStyle(fontSize: 20),
            ))),
        ElevatedButton(
            onPressed: () async {
              final prime = await getPrime();
              this.prime = prime;
              setState(() {});
            },
            child: const Text(
              'get prime',
              style: TextStyle(fontSize: 20),
            ))
      ]),
    );
  }

  Future<String> getPrime() async {
    final prime = await promiseToFuture(testJs());
    return prime;
  }
}
