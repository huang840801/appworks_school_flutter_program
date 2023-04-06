import 'package:flutter/material.dart';

import 'main.dart';

class DetailScreen extends StatelessWidget {
  String size = '';
  int quantity = 0;
  MaterialColor? color;

  DetailScreen({super.key, required this.product});

  final Product product;
  static String routeName = "/detail_screen";

  static Route getRoute(Product product) {
    Route route = MaterialPageRoute(builder: (context) => DetailScreen(product: product));
    return route;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 240, 243, 247),
            centerTitle: true,
            title: const Image(
              image: AssetImage("images/stylish_logo.png"),
              height: 25,
              width: 120,
            ),
            elevation: 2,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        SizedBox(width: 250, height: 300, child: product.image),
                        const SizedBox(height: 10),
                        Text(product.name!, style: const TextStyle(color: Colors.black, fontSize: 20)),
                        const Text('2023030101', style: TextStyle(color: Colors.black, fontSize: 16)),
                        const SizedBox(height: 20),
                        Text('NT ${product.price}', style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Container(color: const Color(0x19333333), height: 1, width: 250),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text('顏色', style: TextStyle(color: Colors.black, fontSize: 16)),
                            const SizedBox(width: 10),
                            Container(color: const Color(0x19333333), height: 18, width: 1),
                            const SizedBox(width: 5),
                            SingleSelectColor(
                              colorList: const [Colors.green, Colors.deepOrange],
                              onSelect: (color) {
                                this.color = color;
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
                              onSelect: (selectedOption) {
                                size = selectedOption;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            const Text('數量', style: TextStyle(color: Colors.black, fontSize: 16)),
                            const SizedBox(width: 10),
                            Container(color: const Color(0x19333333), height: 18, width: 1),
                            const SizedBox(width: 25),
                            QuantityWidget(onChanged: (value) {
                              quantity = value;
                            },),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {

                            showDialog(
                                context: context,
                                builder: (_) =>
                                    AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('color=$color',style: const TextStyle(color: Colors.black, fontSize: 15)),
                                              Text('size=$size',style: const TextStyle(color: Colors.black, fontSize: 15)),
                                              Text('quantity=$quantity',style: const TextStyle(color: Colors.black, fontSize: 15)),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                            );

                          },
                          child: Container(
                            color: const Color.fromARGB(255, 78, 73, 73),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text('請選擇尺寸', style: TextStyle(color: Colors.white, fontSize: 18)),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 3),
                            Text('實品顏色依單品照為主', style: TextStyle(color: Colors.black, fontSize: 15)),
                            SizedBox(height: 3),
                            Text('棉100%', style: TextStyle(color: Colors.black, fontSize: 15)),
                            SizedBox(height: 3),
                            Text('厚薄:薄', style: TextStyle(color: Colors.black, fontSize: 15)),
                            SizedBox(height: 3),
                            Text('彈性:無', style: TextStyle(color: Colors.black, fontSize: 15)),
                            SizedBox(height: 3),
                            Text('素材產地 / 日本', style: TextStyle(color: Colors.black, fontSize: 15)),
                            SizedBox(height: 3),
                            Text('加工產地 / 中國', style: TextStyle(color: Colors.black, fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) => const LinearGradient(colors: [
                                Color.fromARGB(255, 126, 130, 238),
                                Color.fromARGB(255, 151, 192, 231),
                                Color.fromARGB(255, 118, 217, 212),
                              ]).createShader(
                                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                              ),
                              child: const Text('細部說明', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: const Color(0x19333333),
                              ),
                            )
                          ],
                        ),
                        const Text('The Xunyang River sees off guests at night, and the maple leaves and grasses rustle in autumn.The master dismounts, and the guest is in the boat. He wants to drink without an orchestra.', style: TextStyle(color: Colors.black, fontSize: 12)),
                        Column(
                          children: const [
                            SizedBox(height: 10),
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage("images/rivers.png"),
                            ),
                            SizedBox(height: 10),
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage("images/rivers.png"),
                            ),
                            SizedBox(height: 10),
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage("images/rivers.png"),
                            ),
                            SizedBox(height: 10),
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage("images/rivers.png"),
                            ),
                            SizedBox(height: 10),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}

class SingleSelectColor extends StatefulWidget {
  final List<MaterialColor> colorList;
  final Function(MaterialColor) onSelect;

  const SingleSelectColor({super.key, required this.colorList, required this.onSelect});

  @override
  SingleSelectColorState createState() => SingleSelectColorState();
}

class SingleSelectColorState extends State<SingleSelectColor> {
  int _selectedIndex = -1;

  void _handleOptionSelect(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onSelect(widget.colorList[index]);
    });
  }

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
                    _handleOptionSelect(index);
                  },
                  style: ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.all(const Size(40, 40)),
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                    side: MaterialStateProperty.all(BorderSide(color: _selectedIndex == index ? Colors.black : Colors.transparent, width: 1.0, style: BorderStyle.solid)),
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
  final Function(String) onSelect;

  const SingleSelectSize({super.key, required this.sizeList, required this.onSelect});

  @override
  SingleSelectSizeState createState() => SingleSelectSizeState();
}

class SingleSelectSizeState extends State<SingleSelectSize> {
  int _selectedIndex = -1;

  void _handleOptionSelect(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onSelect(widget.sizeList[index]);
    });
  }

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
                  _handleOptionSelect(index);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: _selectedIndex == index ? white : grey,
                ),
                child: Text(widget.sizeList[index], style: TextStyle(color: _selectedIndex == index ? grey : white, fontSize: 12)),
              ),
              const SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }
}

class QuantityWidget extends StatefulWidget {
  final Function(int) onChanged;
  const QuantityWidget({super.key, required this.onChanged});

  @override
  QuantityWidgetState createState() => QuantityWidgetState();
}

class QuantityWidgetState extends State<QuantityWidget> {
  int _value = 1;

  void _increment() {
    setState(() {
      _value++;
      widget.onChanged(_value);
    });
  }

  void _decrement() {
    setState(() {
      if (_value > 0) {
        _value--;
        widget.onChanged(_value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: RawMaterialButton(
            onPressed: _decrement,
            elevation: 2.0,
            fillColor: Colors.black,
            padding: const EdgeInsets.all(0),
            shape: const CircleBorder(),
            child: const Icon(
              color: Colors.white,
              Icons.remove,
              size: 15,
            ),
          ),
        ),
        const SizedBox(width: 50),
        Text('$_value'),
        const SizedBox(width: 50),
        SizedBox(
          width: 20,
          height: 20,
          child: RawMaterialButton(
            onPressed: () {
              _increment();
            },
            elevation: 2.0,
            fillColor: Colors.black,
            padding: const EdgeInsets.all(0),
            shape: const CircleBorder(),
            child: const Icon(
              color: Colors.white,
              Icons.add,
              size: 15,
            ),
          ),
        )
      ],
    );
  }
}
