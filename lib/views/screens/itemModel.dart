// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemModel {
  int id;
  String name;
  String description;
  ItemModel({
    required this.id,
    required this.name,
    required this.description,
  });

  ItemModel copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProgramingLanguageModel(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
