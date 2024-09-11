import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_say/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'say_two_logic.dart';

class SayTwoPage extends GetView<SayTwoLogic> {
  @override
  Widget build(BuildContext context) {
    Widget _tapItem(int index, BuildContext context) {
      final titles = ['Clean all data', 'About US', 'Privacy Policy'];
      return GestureDetector(
        child: Container(
          width: double.infinity,
          height: 44,
          color: Colors.transparent,
          child: <Widget>[
            Expanded(
                child: Text(
              titles[index],
              style: const TextStyle(fontSize: 15),
            )),
            const Icon(
              Icons.keyboard_arrow_right,
              size: 20,
              color: Colors.grey,
            ),
          ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
        ),
        onTap: () {
          switch (index) {
            case 0:
              controller.cleanSaysData();
              break;
            case 1:
              controller.aboutSaysUS(context);
              break;
            case 2:
              controller.aboutSaysPrivacy(context);
              break;
          }
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          ).decorated(
              gradient: LinearGradient(
                  colors: [const Color(0xffddff6e), bgColor],
                  stops: const [0.0, 0.3],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
                child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  _tapItem(0, context),
                  _tapItem(1, context),
                  _tapItem(2, context)
                ].toColumn(
                    separator: Divider(
                  height: 14,
                  color: Colors.grey.withOpacity(0.3),
                )),
              )
                  .decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12))
                  .marginAll(12),
            )),
          )
        ],
      ),
    );
  }
}
