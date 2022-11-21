import 'package:ecommerce_app/logic/controllers/product%20controller.dart';
import 'package:get/instance_manager.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
