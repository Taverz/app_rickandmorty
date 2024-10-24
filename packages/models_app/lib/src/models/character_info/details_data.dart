class DetailsData {
  final CharacterAttribute? status;
  final String title;
  final String value;
  const DetailsData({
    required this.status,
    required this.title,
    required this.value,
  });
}

abstract class CharacterAttribute {
  String get value;
}

enum Status implements CharacterAttribute {
  alive('Alive'),
  dead('Dead'),
  unknown('unknown');

  final String _value;
  const Status(this._value);

  @override
  String get value => _value;

  static Status fromString(String value) {
    return Status.values.firstWhere(
      (status) => status.value.toLowerCase() == value.toLowerCase(),
      orElse: () => Status.unknown,
    );
  }
}

enum Gender implements CharacterAttribute {
  female('Female'),
  male('Male'),
  genderless('Genderless'),
  unknown('unknown');

  final String _value;
  const Gender(this._value);

  @override
  String get value => _value;

  static Gender fromString(String value) {
    return Gender.values.firstWhere(
      (status) => status.value.toLowerCase() == value.toLowerCase(),
      orElse: () => Gender.unknown,
    );
  }
}

enum Species implements CharacterAttribute {
  human('Human'),
  alien('Alien'),
  unknown('unknown');

  final String _value;
  const Species(this._value);

  @override
  String get value => _value;

  static Species fromString(String value) {
    return Species.values.firstWhere(
      (status) => status.value.toLowerCase() == value.toLowerCase(),
      orElse: () => Species.unknown,
    );
  }
}
