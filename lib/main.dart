import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MainViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('顏色', style: TextStyle(color: Colors.black, fontSize: 16)),
                    const SizedBox(width: 10),
                    Container(color: const Color(0x19333333), height: 18, width: 1),
                    const SizedBox(width: 5),
                    const SingleSelectColor(
                      colorList: [Colors.green, Colors.deepOrange],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text('尺寸', style: TextStyle(color: Colors.black, fontSize: 16)),
                    const SizedBox(width: 10),
                    Container(color: const Color(0x19333333), height: 18, width: 1),
                    const SizedBox(width: 10),
                    const SingleSelectSize(
                      sizeList: ['S', 'M', 'L'],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class SingleSelectColor extends StatelessWidget {
  final List<MaterialColor> colorList;

  const SingleSelectColor({super.key, required this.colorList});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        colorList.length,
        (int index) {
          return Consumer<MainViewModel>(
            builder: (context, cartModel, child) =>
                Row(
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          context.read<MainViewModel>().onColorSelected(index);
                        },
                        style: ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: MaterialStateProperty.all(const Size(40, 40)),
                          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                          side: MaterialStateProperty.all(BorderSide(color: getColor(index, cartModel.selectedColorIndex), width: 1.0, style: BorderStyle.solid)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                        ),
                        child: Container(color: colorList[index], height: 18, width: 18)),
                  ],
                ),
          );
        },
      ),
    );
  }

  Color getColor(int index, int selectedColorIndex) {
    return selectedColorIndex == index ? Colors.black : Colors.transparent;
  }
}

class SingleSelectSize extends StatelessWidget {
  final List<String> sizeList;
  final grey = const Color.fromARGB(255, 87, 99, 108);
  final white = Colors.white;

  const SingleSelectSize({super.key, required this.sizeList});

  @override
  Widget build(BuildContext context) {

    Color getBackgroundColor(int index, int selectedSizeIndex) {
      return selectedSizeIndex == index ? white : grey;
    }

    Color getTextColor(int index, int selectedSizeIndex) {
      return selectedSizeIndex == index ? grey : white;
    }

    return Consumer<MainViewModel>(
      builder: (context, cartModel, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
          sizeList.length,
              (int index) {
            return Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<MainViewModel>().onSizeSelected(index);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: getBackgroundColor(index, cartModel.selectedSizeIndex),
                  ),
                  child: Text(sizeList[index], style: TextStyle(color: getTextColor(index, cartModel.selectedSizeIndex), fontSize: 12)),
                ),
                const SizedBox(width: 10),
              ],
            );
          },
        ),
      )
    );
  }
}
