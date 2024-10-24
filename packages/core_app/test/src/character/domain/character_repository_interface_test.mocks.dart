// Mocks generated by Mockito 5.4.4 from annotations
// in core_app/test/src/character/domain/character_repository_interface_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:core_app/src/character/domain/character_repository_interface.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:models_app/models_app.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ICharacterRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockICharacterRepository extends _i1.Mock
    implements _i2.ICharacterRepository {
  MockICharacterRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Character>> getCharacters() => (super.noSuchMethod(
        Invocation.method(
          #getCharacters,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Character>>.value(<_i4.Character>[]),
      ) as _i3.Future<List<_i4.Character>>);

  @override
  _i3.Future<void> toggleLike({
    required int? idCharacter,
    required bool? liked,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #toggleLike,
          [],
          {
            #idCharacter: idCharacter,
            #liked: liked,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<_i4.Character>> getLikedCharacters() => (super.noSuchMethod(
        Invocation.method(
          #getLikedCharacters,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Character>>.value(<_i4.Character>[]),
      ) as _i3.Future<List<_i4.Character>>);
}
