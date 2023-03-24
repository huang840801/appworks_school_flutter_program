import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(DevicePreview(builder: (context) => const MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(image: null, name: null, price: null, title: '女裝'),
      Product(image: womanImage(), name: '特級極輕女裝羽絨外套', price: 123, title: null),
      Product(image: womanImage(), name: '特級極輕女裝羽絨外套', price: 123, title: null),
      Product(image: womanImage(), name: '特級極輕女裝羽絨外套', price: 123, title: null),
      Product(image: null, name: null, price: null, title: '男裝'),
      Product(image: manImage(), name: '特級極輕男裝羽絨外套', price: 456, title: null),
      Product(image: manImage(), name: '特級極輕男裝羽絨外套', price: 456, title: null),
      Product(image: manImage(), name: '特級極輕男裝羽絨外套', price: 456, title: null),
      Product(image: null, name: null, price: null, title: '配件'),
      Product(image: accessoriesImage(), name: '配件', price: 10, title: null),
      Product(image: accessoriesImage(), name: '配件', price: 10, title: null),
      Product(image: accessoriesImage(), name: '配件', price: 10, title: null),
    ];

    return MaterialApp(
      useInheritedMediaQuery: true,
      title: 'Flutter Demo',
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
          body: LayoutBuilder(
            builder: (context, constraint) {
              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 180,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 7, right: 7),
                              child: SizedBox(
                                height: 100,
                                width: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: const Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage("images/rivers.png"),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Container(
                    height: constraint.maxHeight - 180,
                    color: Colors.white,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(padding: const EdgeInsets.only(top: 4, bottom: 4), child: getProduct(products[index]));
                          }),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  Widget getProduct(Product product) {
    if (product.title == null) {
      return SizedBox(
        height: 100,
        width: 300,
        child: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {},
            child: OutlinedButton(
                onPressed: null,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                  side: MaterialStateProperty.all(const BorderSide(color: Colors.black, width: 1.0, style: BorderStyle.solid)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: product.image),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name!,
                          style: const TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          'NT ${product.price}',
                          style: const TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        }),
      );
    } else {
      return Center(child: Text(product.title!, style: const TextStyle(color: Colors.black, fontSize: 15)));
    }
  }

  Image manImage() {
    return const Image(width: 80, fit: BoxFit.fill, image: AssetImage("images/coat_man.png"));
  }

  Image womanImage() {
    return const Image(width: 80, fit: BoxFit.fill, image: AssetImage("images/coat_woman.png"));
  }

  Image accessoriesImage() {
    return const Image(width: 80, fit: BoxFit.fill, image: AssetImage("images/accessories.png"));
  }
}

class Product {
  late String? name;
  late int? price;
  late Image? image;
  late String? title;

  Product({required this.name, required this.price, this.image, required this.title});
}