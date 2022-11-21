import 'package:ecommerce_app/models/product_models.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ecommerce_app/services/product_services.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favouriteList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    List? storedShoppings = storage.read<List>("isFavouritesList");
    //check this later if it's storing after refreshing the app
    if (storedShoppings != null) {
      favouriteList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavorites(int productId) async {
    var existingIndex =
        favouriteList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favouriteList.removeAt(existingIndex);
      await storage.remove("isFavouritesList");
    } else {
      favouriteList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavouritesList", favouriteList);
    }
  }

  bool isFavorites(int productId) {
    return favouriteList.any((element) => element.id == productId);
  }
}
