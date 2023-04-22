import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final channel = const MethodChannel('MyChannel');
  String prime = 'MyPrime';

  @override
  void initState() {
    super.initState();

    channel.setMethodCallHandler((call) async {
      print("Huang flutter method " + call.method);
      print("Huang flutter arguments " + call.arguments);
      prime = call.arguments;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        Container(
            padding: const EdgeInsets.all(16),
            child: Center(child: Text(prime, style: const TextStyle(fontSize: 20),))),
        ElevatedButton(onPressed:(){
          showMessage();
        }, child: const Text('TapPay', style: TextStyle(fontSize: 20),))
      ]),
    );
  }

  Future<void> showMessage() async {
    await channel.invokeMethod('To TapPay', 'Hello Android');
  }
}
