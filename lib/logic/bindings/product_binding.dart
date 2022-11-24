import 'package:ecommerce_app/logic/controllers/cart_controller.dart';
import 'package:ecommerce_app/logic/controllers/category_controller.dart';
import 'package:ecommerce_app/logic/controllers/product%20controller.dart';
import 'package:get/instance_manager.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
