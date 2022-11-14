import 'package:ecommerce_app/logic/controllers/auth_controller.dart';
import 'package:get/instance_manager.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies(){
    Get.put(AuthController());
  }

}
