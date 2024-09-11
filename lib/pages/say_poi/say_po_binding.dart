import 'package:get/get.dart';

import 'say_po_logic.dart';

class SayPoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
