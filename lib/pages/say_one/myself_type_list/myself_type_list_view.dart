import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import '../say_item.dart';
import 'myself_type_list_logic.dart';

class MyselfTypeListPage extends GetView<MyselfTypeListLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyselfTypeListLogic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Obx(() {
            return Text(controller.titleWord.value);
          }),
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
              child: Text(controller.isEdit ? 'Cancel' : 'Edit').marginOnly(right: 20),
              onTap: () {
                controller.isEdit = !controller.isEdit;
                controller.update();
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: SafeArea(
                  child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  <Widget>[
                    Stack(
                      children: [
                        Obx(() {
                          return Image.asset(
                            'assets/image${controller.index.value}.webp',
                            width: double.infinity,
                            height: 131,
                            fit: BoxFit.fill,
                          );
                        }),
                        <Widget>[
                          Obx(() {
                            return Text(
                              controller.titleWord.value,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ).marginOnly(top: 25);
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            child: Container(
                              width: 100,
                              height: 37,
                              child: <Widget>[
                                const Icon(
                                  Icons.add_circle,
                                  size: 13,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Add',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )
                              ].toRow(
                                  mainAxisAlignment: MainAxisAlignment.center),
                            ).decorated(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black)),
                            onTap: () {},
                          )
                        ]
                            .toColumn(
                                crossAxisAlignment: CrossAxisAlignment.start)
                            .marginOnly(left: 20)
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(minHeight: 160),
                      child: Obx(() {
                        return controller.list.value.isEmpty
                            ? Center(
                                child: <Widget>[
                                  Image.asset(
                                    'assets/noData.webp',
                                    width: 39,
                                    height: 42,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Not filled in',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  )
                                ].toColumn(),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.only(bottom: 12),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.list.value.length,
                                itemBuilder: (_, index) {
                                  final entity = controller.list.value[index];
                                  return SayItem(
                                    entity,
                                    isEdit: controller.isEdit,
                                    deleteOnTap: () async {
                                      controller.deleteData(entity);
                                    },
                                  );
                                });
                      }),
                    ).decorated(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.5), width: 1),
                            left: BorderSide(
                                color: Colors.grey.withOpacity(0.5), width: 1),
                            right: BorderSide(
                                color: Colors.grey.withOpacity(0.5), width: 1)),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)))
                  ].toColumn()
                ].toColumn(),
              ).marginAll(15)),
            )
          ],
        ),
      );
    });
  }
}
