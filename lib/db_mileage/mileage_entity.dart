import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';

class MileageEntity {
  int id;
  DateTime createTime;
  String startLocation;
  String endLocation;
  int mileage;
  TrafficEntity traffic;
  String content;

  MileageEntity({
    required this.id,
    required this.createTime,
    required this.startLocation,
    required this.endLocation,
    required this.mileage,
    required this.traffic,
    required this.content,
  });

  factory MileageEntity.fromJson(Map<String, dynamic> json) {
    return MileageEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      startLocation: json['startLocation'],
      endLocation: json['endLocation'],
      mileage: json['mileage'],
      traffic: TrafficEntity.fromJson(jsonDecode(json['traffic'])),
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'startLocation': startLocation,
      'endLocation': endLocation,
      'mileage': mileage,
      'traffic': jsonEncode(traffic.toJson()),
      'content': content,
    };
  }

  String get createTimeStr {
    return DateFormat('yyyy.MM.dd').format(createTime);
  }
}

class TrafficEntity {
  int id;
  DateTime createTime;
  String name;
  Uint8List image;

  TrafficEntity({
    required this.id,
    required this.createTime,
    required this.name,
    required this.image,
  });

  factory TrafficEntity.fromJson(Map<String, dynamic> json) {
    return TrafficEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      name: json['name'],
      image: Uint8List.fromList(List.from(json['image'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'name': name,
      'image': image,
    };
  }

}