import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String id;
  final String description;
  bool? isDone;
  bool? isDeleted;

  Task({required this.title, required this.id, required this.description, this.isDone = false, this.isDeleted = false}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({String? title, String? id, String? description, bool? isDone, bool? isDeleted}) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'id': id, 'description': description, 'isDone': isDone, 'isDeleted': isDeleted};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'] ?? false,
      isDeleted: map['isDeleted'] ?? false,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, id, description, isDone, isDeleted];
}
