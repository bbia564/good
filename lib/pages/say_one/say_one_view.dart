import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_say/pages/say_one/say_item.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'say_one_logic.dart';

class SayOnePage extends GetView<SayOneLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Image.asset(
                        'assets/image0.webp',
                        width: double.infinity,
                        height: 131,
                        fit: BoxFit.fill,
                      ),
                      <Widget>[
                        GestureDetector(
                          child: Container(
                            color: Colors.transparent,
                            child: <Widget>[
                              const Text(
                                'Good morning quote',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                size: 20,
                                color: Colors.grey,
                              )
                            ].toRow().marginOnly(top: 25),
                          ),
                          onTap: () {
                            Get.toNamed('/myselfTypeListPage', arguments: 0)
                                ?.then((_) {
                              controller.getSays();
                            });
                          },
                        ),
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
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              )
                            ].toRow(
                                mainAxisAlignment: MainAxisAlignment.center),
                          ).decorated(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black)),
                          onTap: () {
                            Get.toNamed('/sayAddPage',arguments: 0)?.then((value) {
                              controller.getSays();
                            });
                          },
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
                      return controller.list0.value.isEmpty
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
                              itemCount: controller.list0.value.length,
                              itemBuilder: (_, index) {
                                final entity = controller.list0.value[index];
                                return SayItem(entity);
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
                ].toColumn(),
                const SizedBox(height: 20,),
                <Widget>[
                  Stack(
                    children: [
                      Image.asset(
                        'assets/image1.webp',
                        width: double.infinity,
                        height: 131,
                        fit: BoxFit.fill,
                      ),
                      <Widget>[
                        GestureDetector(
                          child: Container(
                            color: Colors.transparent,
                            child: <Widget>[
                              const Text(
                                'Good night quotes',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                size: 20,
                                color: Colors.grey,
                              )
                            ].toRow().marginOnly(top: 25),
                          ),
                          onTap: () {
                            Get.toNamed('/myselfTypeListPage', arguments: 1)
                                ?.then((_) {
                              controller.getSays();
                            });
                          },
                        ),
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
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              )
                            ].toRow(
                                mainAxisAlignment: MainAxisAlignment.center),
                          ).decorated(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black)),
                          onTap: () {
                            Get.toNamed('/sayAddPage',arguments: 1)?.then((value) {
                              controller.getSays();
                            });
                          },
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
                      return controller.list1.value.isEmpty
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
                          itemCount: controller.list1.value.length,
                          itemBuilder: (_, index) {
                            final entity = controller.list1.value[index];
                            return SayItem(entity);
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
                ].toColumn(),
                const SizedBox(height: 20,),
                <Widget>[
                  Stack(
                    children: [
                      Image.asset(
                        'assets/image2.webp',
                        width: double.infinity,
                        height: 131,
                        fit: BoxFit.fill,
                      ),
                      <Widget>[
                        GestureDetector(
                          child: Container(
                            color: Colors.transparent,
                            child: <Widget>[
                              const Text(
                                'Dream quote',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                size: 20,
                                color: Colors.grey,
                              )
                            ].toRow().marginOnly(top: 25),
                          ),
                          onTap: () {
                            Get.toNamed('/myselfTypeListPage', arguments: 2)
                                ?.then((_) {
                              controller.getSays();
                            });
                          },
                        ),
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
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              )
                            ].toRow(
                                mainAxisAlignment: MainAxisAlignment.center),
                          ).decorated(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black)),
                          onTap: () {
                            Get.toNamed('/sayAddPage',arguments: 2)?.then((value) {
                              controller.getSays();
                            });
                          },
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
                      return controller.list2.value.isEmpty
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
                          itemCount: controller.list2.value.length,
                          itemBuilder: (_, index) {
                            final entity = controller.list2.value[index];
                            return SayItem(entity);
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
                ].toColumn(),

              ].toColumn(),
            ).marginAll(15)),
          ).decorated(
              gradient: LinearGradient(
                  colors: [const Color(0xffddff6e), bgColor],
                  stops: const [0.0, 0.3],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ],
      ),
    );
  }
}
