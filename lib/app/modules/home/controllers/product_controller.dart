import 'package:flutter_getx_test/app/modules/home/models/product.dart';
import 'package:flutter_getx_test/app/modules/home/services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    productList.value = products;
  }
}
