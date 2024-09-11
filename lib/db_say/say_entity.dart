import 'package:intl/intl.dart';

class SayEntity {
  int id;
  DateTime createdTime;
  int type;
  String words;

  SayEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.words,
  });

  factory SayEntity.fromJson(Map<String, dynamic> json) => SayEntity(
    id: json["id"],
    createdTime: DateTime.parse(json["created_time"]),
    type: json["type"],
    words: json["words"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_time": createdTime.toIso8601String(),
    "type": type,
    "words": words,
  };

  String get timeString {
    return DateFormat('yyyy-MM-dd').format(createdTime);
  }
}