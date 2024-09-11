import 'package:get/get.dart';
import 'package:good_say/pages/say_one/say_one_logic.dart';
import 'package:good_say/pages/say_two/say_two_logic.dart';

import 'say_tab_logic.dart';

class SayTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SayTabLogic());
    Get.lazyPut(() => SayOneLogic());
    Get.lazyPut(() => SayTwoLogic());
  }
}
