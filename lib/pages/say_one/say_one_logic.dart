import 'package:get/get.dart';
import 'package:good_say/db_say/db_say.dart';
import 'package:good_say/db_say/say_entity.dart';

class SayOneLogic extends GetxController {

  DBSay dbSay = Get.find<DBSay>();

  var list0  = <SayEntity>[].obs;
  var list1  = <SayEntity>[].obs;
  var list2  = <SayEntity>[].obs;

  void getSays() async {
    final result = await dbSay.getAllData();
    final result0 = result.where((element) => element.type == 0).toList();
    final result1 = result.where((element) => element.type == 1).toList();
    final result2 = result.where((element) => element.type == 2).toList();
    if (result0.length > 3) {
      list0.value = result0.sublist(0, 3);
    } else {
      list0.value = result0;
    }
    if (result1.length > 3) {
      list1.value = result1.sublist(0, 3);
    } else {
      list1.value = result1;
    }
    if (result2.length > 3) {
      list2.value = result2.sublist(0, 3);
    } else {
      list2.value = result2;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getSays();
    super.onInit();
  }

}
