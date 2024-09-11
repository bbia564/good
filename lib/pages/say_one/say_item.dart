import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_say/db_say/say_entity.dart';
import 'package:styled_widget/styled_widget.dart';

class SayItem extends StatelessWidget {
  const SayItem(this.entity, {this.isEdit = false,this.deleteOnTap, Key? key}) : super(key: key);

  final SayEntity entity;
  final bool isEdit;
  final VoidCallback? deleteOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12,left: 12,right: 12),
      child: <Widget>[
        <Widget>[
          Text(
            entity.timeString,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Visibility(
            visible: isEdit,
            child: GestureDetector(
                child: const Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 22,
            ).marginOnly(left: 15),onTap: (){
                  deleteOnTap?.call();
            },),
          )
        ].toRow(),
        Text(
          entity.words,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.grey.withOpacity(0.4),
        ).marginOnly(top: 12),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    );
  }
}
