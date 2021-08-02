//import 'dart:collection';

import '../user/user.dart';
import '../group/group.dart';

class Task {
  int id;
  String title;
  User creator;
  late User assignee;
  late Group accessGroup;
  String? description;
  String? type;
  String? importance;
  String? placement;
  double? estimatedHour;
  DateTime? startAt;
  DateTime? finishAt;
  DateTime? due;
  DateTime? startedAt;
  DateTime? finishedAt;
  late DateTime createdAt;
  late DateTime updatedAt;
  
  Task(
    this.creator,
    this.id,
    this.title, {
    this.description,
    User? assignee,
    Group? accessGroup,
    this.placement,
    this.estimatedHour,
    this.type,
    this.due,
    this.startAt,
    this.finishAt,
    this.startedAt,
    this.finishedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.accessGroup = accessGroup ?? Group.one(creator);
    this.assignee = assignee ?? creator;
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? this.createdAt;
  }
  
  Task update({    // NOTE I hate this.
    String? title,
  User? creator,
  User? assignee,
  Group? accessGroup,
  String? description,
  String? type,
  String? importance,
  String? placement,
  double? estimatedHour,
  DateTime? startAt,
  DateTime? finishAt,
  DateTime? due,
  DateTime? startedAt,
  DateTime? finishedAt,
  DateTime? createdAt,
  DateTime? updatedAt,}) {
    this.title = title ?? this.title;
    this.creator = creator ?? this.creator;
    this.assignee = assignee ?? this.assignee;
    this.accessGroup = accessGroup ?? this.accessGroup;
    this.description = description ?? this.description;
    this.type = type ?? this.type;
    this.importance = importance ?? importance;
    this.placement = placement ?? this.placement;
    this.estimatedHour = estimatedHour ?? this.estimatedHour;
    this.startAt = startAt ?? this.startAt;
    this.finishAt = finishAt ?? this.finishAt;
    this.due = due ?? this.due;
    this.startedAt = startedAt ?? this.startedAt;
    this.finishedAt = finishedAt ?? this.finishedAt;
    this.createdAt = createdAt ?? this.createdAt;
    this.updatedAt = updatedAt ?? this.updatedAt;
    return this;
  }

  @override
  String toString() {
    return id.toString();
  }
  Map<String, dynamic> toJson() => {
        'id' : id,
        'title': title,
      };
}



