import 'dart:convert';

class CharacterInfoModel {
  final int id;
  final String imageUrl;

  final String status;
  final String species;
  final String type;
  final String gender;

  CharacterInfoModel({
    required this.id,
    required this.imageUrl,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
  });

  CharacterInfoModel copyWith({
    int? id,
    String? imageUrl,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) {
    return CharacterInfoModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
    };
  }

  factory CharacterInfoModel.fromMap(Map<String, dynamic> map) {
    return CharacterInfoModel(
      id: map['id'] as int,
      imageUrl: map['imageUrl'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      type: map['type'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterInfoModel.fromJson(String source) =>
      CharacterInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CharacterInfoModel(id: $id, imageUrl: $imageUrl, status: $status, species: $species, type: $type, gender: $gender)';
  }

  @override
  bool operator ==(covariant CharacterInfoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.imageUrl == imageUrl &&
        other.status == status &&
        other.species == species &&
        other.type == type &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageUrl.hashCode ^
        status.hashCode ^
        species.hashCode ^
        type.hashCode ^
        gender.hashCode;
  }
}
