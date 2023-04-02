import 'package:flutter/material.dart';

import 'api/product_list_response.dart';
import 'main.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

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
                        SizedBox(width: 250, height: 300, child: Image.network(product.mainImage)),
                        const SizedBox(height: 10),
                        Text(product.title!, style: const TextStyle(color: Colors.black, fontSize: 20)),
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
                            const SizedBox(width: 10),
                            Container(color: Colors.green, height: 18, width: 18),
                            const SizedBox(width: 10),
                            Container(color: Colors.deepPurpleAccent, height: 18, width: 18),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text('尺寸', style: TextStyle(color: Colors.black, fontSize: 16)),
                            const SizedBox(width: 10),
                            Container(color: const Color(0x19333333), height: 18, width: 1),
                            const SizedBox(width: 10),
                            const SizeButton(size: 'S'),
                            const SizedBox(width: 8),
                            const SizeButton(size: 'M'),
                            const SizedBox(width: 8),
                            const SizeButton(size: 'L'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text('數量', style: TextStyle(color: Colors.black, fontSize: 16)),
                            const SizedBox(width: 10),
                            Container(color: const Color(0x19333333), height: 18, width: 1),
                            const SizedBox(width: 25),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: RawMaterialButton(
                                onPressed: () {},
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
                            const Text('1', style: TextStyle(color: Colors.black, fontSize: 16)),
                            const SizedBox(width: 50),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: RawMaterialButton(
                                onPressed: () {},
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: const Color.fromARGB(255, 78, 73, 73),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text('請選擇尺寸', style: TextStyle(color: Colors.white, fontSize: 18)),
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
                        const Text(
                            'The Xunyang River sees off guests at night, and the maple leaves and grasses rustle in autumn.The master dismounts, and the guest is in the boat. He wants to drink without an orchestra.',
                            style: TextStyle(color: Colors.black, fontSize: 12)),
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
          )),
    );
  }
}

class SizeButton extends StatelessWidget {
  final String size;

  const SizeButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: const Color.fromARGB(255, 87, 99, 108),
      ),
      child: Text(size, style: const TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}