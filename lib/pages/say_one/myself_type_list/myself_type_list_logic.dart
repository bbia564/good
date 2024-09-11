import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../db_say/db_say.dart';
import '../../../db_say/say_entity.dart';

class MyselfTypeListLogic extends GetxController {

  DBSay dbSay = Get.find<DBSay>();

  var titleWord = ''.obs;
  var list  = <SayEntity>[].obs;
  final index = 0.obs;
  bool isEdit = false;

  void getSays() async {
    final result = await dbSay.getAllData();
    list.value = result.where((element) => element.type == index.value).toList();
  }

  deleteData(SayEntity entity) async {
    Get.dialog(AlertDialog(
      content: const Text('Do you want to delete this data?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbSay.deleteSay(entity);
            getSays();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    index.value = Get.arguments;
    switch (index.value) {
      case 0:
        titleWord.value = 'Good morning quote';
        break;
      case 1:
        titleWord.value = 'Good night quotes';
        break;
      case 2:
        titleWord.value = 'Dream quote';
      }
    getSays();
    super.onInit();
  }

}
