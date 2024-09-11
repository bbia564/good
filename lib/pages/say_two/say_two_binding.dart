import 'package:get/get.dart';

import 'say_two_logic.dart';

class SayTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SayTwoLogic());
  }
}
