import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class Task {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final String date;
  final String startTime;
  final String endTime;
  final int reminde;
  final String repeat;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.reminde,
    required this.repeat,
  });

  Task copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    String? date,
    String? startTime,
    String? endTime,
    int? reminde,
    String? repeat,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      reminde: reminde ?? this.reminde,
      repeat: repeat ?? this.repeat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'reminde': reminde,
      'repeat': repeat,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      isCompleted: map['isCompleted'] as bool,
      date: map['date'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      reminde: map['reminde'] as int,
      repeat: map['repeat'] as String,
    );
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, isCompleted: $isCompleted, date: $date, startTime: $startTime, endTime: $endTime, reminde: $reminde, repeat: $repeat)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isCompleted == isCompleted &&
        other.date == date &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.reminde == reminde &&
        other.repeat == repeat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isCompleted.hashCode ^
      date.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      reminde.hashCode ^
      repeat.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
