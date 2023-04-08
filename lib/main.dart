import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

  int selectedColorIndex = -1;
  int selectedSizeIndex = -1;

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
                    SingleSelectColor(
                      selectedColorIndex: selectedColorIndex,
                      colorList: const [Colors.green, Colors.deepOrange],
                      onSelect: (index) {
                        setState(() {
                          selectedSizeIndex = -1;
                          selectedColorIndex = index;
                        });
                      },
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
                    SingleSelectSize(
                      selectedSizeIndex: selectedSizeIndex,
                      sizeList: const ['S', 'M', 'L'],
                      onSelect: (index) {
                        setState(() {
                          selectedSizeIndex = index;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}

class SingleSelectColor extends StatefulWidget {
  final List<MaterialColor> colorList;
  final Function(int) onSelect;
  int selectedColorIndex;

  SingleSelectColor({super.key,
    required this.selectedColorIndex,
    required this.colorList,
    required this.onSelect});

  @override
  SingleSelectColorState createState() => SingleSelectColorState();
}

class SingleSelectColorState extends State<SingleSelectColor> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        widget.colorList.length,
            (int index) {
          return Row(
            children: [
              OutlinedButton(
                  onPressed: () {
                    widget.onSelect(index);
                  },
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.all(const Size(40, 40)),
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                    side: MaterialStateProperty.all(BorderSide(color: widget.selectedColorIndex == index ? Colors.black : Colors.transparent, width: 1.0, style: BorderStyle.solid)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  ),
                  child: Container(color: widget.colorList[index], height: 18, width: 18)),
            ],
          );
        },
      ),
    );
  }
}

class SingleSelectSize extends StatefulWidget {
  final List<String> sizeList;
  final Function(int) onSelect;
  int selectedSizeIndex;

  SingleSelectSize({super.key,
    required this.selectedSizeIndex,
    required this.sizeList,
    required this.onSelect});

  @override
  SingleSelectSizeState createState() => SingleSelectSizeState();
}

class SingleSelectSizeState extends State<SingleSelectSize> {

  @override
  Widget build(BuildContext context) {
    const grey = Color.fromARGB(255, 87, 99, 108);
    const white = Colors.white;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        widget.sizeList.length,
            (int index) {
          return Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.onSelect(index);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: widget.selectedSizeIndex == index ? white : grey,
                ),
                child: Text(widget.sizeList[index], style: TextStyle(color: widget.selectedSizeIndex == index ? grey : white, fontSize: 12)),
              ),
              const SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }
}
