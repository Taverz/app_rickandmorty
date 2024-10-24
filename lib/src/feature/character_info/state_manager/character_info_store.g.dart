// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterInfoStore on _CharacterInfoStore, Store {
  late final _$characterInfoAtom =
      Atom(name: '_CharacterInfoStore.characterInfo', context: context);

  @override
  CharacterInfoModel? get characterInfo {
    _$characterInfoAtom.reportRead();
    return super.characterInfo;
  }

  @override
  set characterInfo(CharacterInfoModel? value) {
    _$characterInfoAtom.reportWrite(value, super.characterInfo, () {
      super.characterInfo = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CharacterInfoStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchCharacterInfoAsyncAction =
      AsyncAction('_CharacterInfoStore.fetchCharacterInfo', context: context);

  @override
  Future<void> fetchCharacterInfo() {
    return _$fetchCharacterInfoAsyncAction
        .run(() => super.fetchCharacterInfo());
  }

  @override
  String toString() {
    return '''
characterInfo: ${characterInfo},
isLoading: ${isLoading}
    ''';
  }
}
