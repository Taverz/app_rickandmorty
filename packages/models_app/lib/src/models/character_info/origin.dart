import 'dart:convert';

class Origin {
  final String name;
  final String url;

  Origin({
    required this.name,
    required this.url,
  });

  Origin copyWith({
    String? name,
    String? url,
  }) {
    return Origin(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory Origin.fromMap(Map<String, dynamic> map) {
    return Origin(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Origin.fromJson(String source) =>
      Origin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Origin(name: $name, url: $url)';

  @override
  bool operator ==(covariant Origin other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
