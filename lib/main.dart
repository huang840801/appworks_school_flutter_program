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

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({
    Key? key,
    required this.selectedColorIndex,
    required this.selectedSizeIndex,
    required Widget child,
  }) : super(key: key, child: child);

  final int selectedColorIndex;
  final int selectedSizeIndex;

  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.selectedColorIndex != selectedColorIndex;
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
    return ShareDataWidget(
      selectedColorIndex: selectedColorIndex,
      selectedSizeIndex: selectedSizeIndex,
      child: Scaffold(
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
                        colorList: const [Colors.green, Colors.deepOrange],
                        onSelect: (selectedColorIndex) {
                          setState(() {
                            this.selectedColorIndex = selectedColorIndex;
                            selectedSizeIndex = -1;
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
        ),
      ),
    );
  }
}

class SingleSelectColor extends StatelessWidget {
  final List<MaterialColor> colorList;
  final Function(int) onSelect;

  const SingleSelectColor({super.key, required this.colorList, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        colorList.length,
        (int index) {
          return Row(
            children: [
              OutlinedButton(
                  onPressed: () {
                    onSelect(index);
                  },
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.all(const Size(40, 40)),
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                    side: MaterialStateProperty.all(BorderSide(color: getColor(context, index), width: 1.0, style: BorderStyle.solid)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                  ),
                  child: Container(color: colorList[index], height: 18, width: 18)),
            ],
          );
        },
      ),
    );
  }

  Color getColor(BuildContext context, int index) {
    if (ShareDataWidget.of(context) == null) {
      return Colors.transparent;
    } else {
      return ShareDataWidget.of(context)!.selectedColorIndex == index ? Colors.black : Colors.transparent;
    }
  }
}

class SingleSelectSize extends StatelessWidget {
  final List<String> sizeList;
  final Function(int) onSelect;
  final grey = const Color.fromARGB(255, 87, 99, 108);
  final white = Colors.white;

  const SingleSelectSize({super.key, required this.sizeList, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor(int index) {
      if (ShareDataWidget.of(context) == null) {
        return white;
      } else {
        return ShareDataWidget.of(context)!.selectedSizeIndex == index ? white : grey;
      }
    }

    Color getTextColor(int index) {
      if (ShareDataWidget.of(context) == null) {
        return white;
      } else {
        return ShareDataWidget.of(context)!.selectedSizeIndex == index ? grey : white;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        sizeList.length,
        (int index) {
          return Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  onSelect(index);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: getBackgroundColor(index),
                ),
                child: Text(sizeList[index], style: TextStyle(color: getTextColor(index), fontSize: 12)),
              ),
              const SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }
}
