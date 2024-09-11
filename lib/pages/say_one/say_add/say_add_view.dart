import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_say/pages/say_one/say_add/say_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'say_add_logic.dart';

class SayAddPage extends GetView<SayAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            child: const Text('Commit').marginOnly(right: 20),
            onTap: () {
              controller.add(context);
            },
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  Stack(
                    children: [
                      Image.asset(
                        'assets/image${controller.type}.webp',
                        width: double.infinity,
                        height: 131,
                        fit: BoxFit.fill,
                      ),
                      Obx(() {
                        return Text(
                          'Add${controller.titleWord.value}',
                          style:const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        );
                      }).marginOnly(top: 50, left: 20),
                    ],
                  ),
                  Container(height: 180,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.topCenter,
                    child: SayTextField(maxLength: 500,
                        maxLines: 10,
                        textAlign: TextAlign.start,
                        value: controller.words,
                        hintText: 'Enter something',
                        onChange: (value) {
                          controller.words = value;
                        }),).decorated(
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
                ].toColumn())
                .marginAll(15)),
      ),
    );
  }
}
