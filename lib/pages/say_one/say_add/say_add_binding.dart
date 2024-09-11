import 'package:get/get.dart';

import 'say_add_logic.dart';

class SayAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SayAddLogic());
  }
}
