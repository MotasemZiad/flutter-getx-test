import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_test/app/data/models/product_model.dart';
import 'package:flutter_getx_test/app/modules/home/services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      var products = await RemoteServices.fetchProducts();
      productList.value = products;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
