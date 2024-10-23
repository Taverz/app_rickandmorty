import 'dart:convert';

class EnvModel {
  EnvModel({
    required this.locale,
    required this.theme,
  });

  factory EnvModel.fromMap(Map<String, dynamic> map) {
    return EnvModel(
      locale: map['locale'] as String,
      theme: map['theme'] as String,
    );
  }

  factory EnvModel.fromJson(String source) =>
      EnvModel.fromMap(json.decode(source) as Map<String, dynamic>);
  String locale;
  String theme;

  EnvModel copyWith({
    String? locale,
    String? theme,
  }) {
    return EnvModel(
      locale: locale ?? this.locale,
      theme: theme ?? this.theme,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'locale': locale,
      'theme': theme,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return '$locale: $theme';
  }

  @override
  bool operator ==(covariant EnvModel other) {
    if (identical(this, other)) return true;

    return other.locale == locale && other.theme == theme;
  }

  @override
  int get hashCode => locale.hashCode ^ theme.hashCode;
}
