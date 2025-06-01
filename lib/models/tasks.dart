import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String id;
  final String date;
  final String description;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task({required this.title, required this.id, required this.date, required this.description, this.isDone = false, this.isDeleted = false, this.isFavorite = false}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({String? title, String? id, String? date, String? description, bool? isDone, bool? isDeleted, bool? isFavorite}) {
    return Task(
      title: title ?? this.title,
      id: id ?? this.id,
      date: date ?? this.date,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'id': id, 'date': date, 'description': description, 'isDone': isDone, 'isDeleted': isDeleted, 'isFavorite': isFavorite};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      date: map['date'] ?? '',
      description: map['description'] ?? '',
      isDone: map['isDone'] ?? false,
      isDeleted: map['isDeleted'] ?? false,
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, id, date, description, isDone, isDeleted, isFavorite];
}
