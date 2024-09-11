import 'package:get/get.dart';

import 'myself_type_list_logic.dart';

class MyselfTypeListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyselfTypeListLogic());
  }
}
