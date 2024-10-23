// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  bool? liked; 

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    this.liked = false, 
  });



  Character copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? gender,
    String? image,
    bool? liked,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      liked: liked ?? this.liked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'image': image,
      'liked': liked,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      image: map['image'] as String,
      liked: map['liked'] as bool?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) => Character.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Character(id: $id, name: $name, status: $status, species: $species, gender: $gender, image: $image, liked: $liked)';
  }

  @override
  bool operator ==(covariant Character other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.status == status &&
      other.species == species &&
      other.gender == gender &&
      other.image == image &&
      other.liked == liked;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      status.hashCode ^
      species.hashCode ^
      gender.hashCode ^
      image.hashCode ^
      liked.hashCode;
  }
}
