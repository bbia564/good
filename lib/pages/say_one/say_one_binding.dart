import 'package:get/get.dart';

import 'say_one_logic.dart';

class SayOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SayOneLogic());
  }
}
