import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'say_po_logic.dart';

class SayPoView extends GetView<PageLogic> {
  const SayPoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.wilderman.value
              ? const CircularProgressIndicator(color: Colors.limeAccent)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.ilaq();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
