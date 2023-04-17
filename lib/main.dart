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
  final channel = const MethodChannel('yourpackageName/channelName');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const SizedBox.shrink(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showMessage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showMessage() async{
    await channel.invokeMethod('showMessage',<String,String>{
      'message':'This is a Toast from From Flutter to Android Native Code Yes, It is working'
    });
  }
}
