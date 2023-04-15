import 'dart:core';

import 'package:appworks_school_flutter_program/main_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'api/product_list_response.dart';
import 'detail_screen.dart';

void main() => runApp(MyApp());
// void main() => runApp(DevicePreview(builder: (context) => const MyApp()));

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final viewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {

    viewModel.getAllProductList();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home:
        Scaffold(
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
                        child: BannerImage(viewModel),
                      ),
                    ),
                    SizedBox(
                        height: constraint.maxHeight - 200,
                        child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              dragDevices: {
                                PointerDeviceKind.touch,
                                PointerDeviceKind.mouse,
                              },
                            ),
                            child: (MediaQuery.of(context).size.width > 800)
                                ? _ProductGridView(viewModel)
                                : ProductListView(viewModel)
                        )
                    ),
                  ],
                );
              },
            ))
    );
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

class BannerImage extends StatelessWidget {
  const BannerImage(this. viewModel,{super.key,});
  final MainViewModel viewModel ;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewModel.imageList,
        builder: (context, imageList, child) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemCount: imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7),
                    child: SizedBox(
                      height: 100,
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          imageList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ));
              });
        });
  }
}

class ProductListView extends StatelessWidget {
  final MainViewModel viewModel ;

  const ProductListView(this.viewModel, {super.key,});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewModel.allProductList,
        builder: (context, productList, child) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: productList[index].categoryTitle.isEmpty
                      ? ProductItem(product: productList[index])
                      : Center(
                          child: Text(
                            productList[index].categoryTitle,
                            style: const TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                );
              });
        });
  }
}

class _ProductGridView extends StatelessWidget {
  const _ProductGridView(this. viewModel, {Key? key,}) : super(key: key);
  final MainViewModel viewModel ;

  @override
  Widget build(BuildContext context) {

    List<List<Product>> newProductList = [];

    const double titleLayoutHeight = 40;
    return ValueListenableBuilder(
        valueListenable: viewModel.allProductList,
        builder: (context, productList, child) {
          if (productList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            Product womenTitleProduct = productList.firstWhere((product) => product.categoryTitle == '女裝');
            Product menTitleProduct = productList.firstWhere((product) => product.categoryTitle == '男裝');
            Product accessoriesTitleProduct = productList.firstWhere((product) => product.categoryTitle == '配件');
            int womenTitleProductIndex = productList.indexOf(womenTitleProduct);
            int menTitleProductIndex = productList.indexOf(menTitleProduct);
            int accessoriesTitleProductIndex = productList.indexOf(accessoriesTitleProduct);
            List<Product> womenList = productList.sublist(womenTitleProductIndex + 1, menTitleProductIndex);
            List<Product> menList = productList.sublist(menTitleProductIndex + 1, accessoriesTitleProductIndex);
            List<Product> accessoriesList = productList.sublist(accessoriesTitleProductIndex + 1, productList.length);
            newProductList.add(womenList);
            newProductList.add(menList);
            newProductList.add(accessoriesList);

            return LayoutBuilder(builder: (context, constraint) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Flexible(
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: titleLayoutHeight,
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(color: Colors.white, child: Center(child: Text(getTitle(index), style: const TextStyle(color: Colors.black, fontSize: 15))));
                          },
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int parentIndex) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
                              itemCount: newProductList[parentIndex].length,
                              itemBuilder: (BuildContext context, int childIndex) {
                                return Padding(padding: const EdgeInsets.only(top: 4, bottom: 4), child: ProductItem(product: newProductList[parentIndex][childIndex]));
                              });
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: constraint.maxHeight - titleLayoutHeight,
                          crossAxisCount: 3,
                        ),
                      ),
                    ],
                  ),
                );
              });
          }
        });
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return '女裝';
      case 1:
        return '男裝';
      case 2:
        return '配件';
      default:
        return '';
    }
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product,}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Builder(builder: (context) {
        return GestureDetector(
            onTap: () {
              Route route = DetailScreen.getRoute(product);
              Navigator.push(context, route);
            },
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
                        child: Image.network(product.mainImage)),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title == null ? '' : product.title!,
                          style: const TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          'NT ${product.price}',
                          style: const TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                )));
      }),
    );
  }
}