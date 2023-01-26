import 'package:flutter/material.dart';
import 'package:flutter_getx_test/app/modules/home/controllers/product_controller.dart';
import 'package:flutter_getx_test/app/modules/home/views/product_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "ShopX",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.view_list_rounded,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.grid_view,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => productController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : MasonryGridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        itemCount: productController.productList.length,
                        itemBuilder: (context, index) => ProductTile(
                          product: productController.productList[index],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
