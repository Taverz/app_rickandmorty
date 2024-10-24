import 'package:flutter/material.dart';
import 'package:models_app/models_app.dart';
import 'package:ui_kit_app/src/generated/assets.gen.dart';

class CharacterAttributeIcon {
  Widget getIcon(CharacterAttribute? iconAtt) {
    if (iconAtt is Gender) {
      return _getGenderIcon(iconAtt);
    }
    if (iconAtt is Status) {
      return _getStatusIcon(iconAtt);
    }
    if (iconAtt is Species) {
      return _getSpeciesIcon(iconAtt);
    }
    return Assets.icons.speciesHuman.svg();
  }
}

Widget _getGenderIcon(Gender gender) {
  switch (gender) {
    case Gender.female:
      return Assets.icons.genderFemale.svg();
    case Gender.male:
      return Assets.icons.genderMale.svg();
    case Gender.genderless:
      return Assets.icons.genderUnknown.svg();
    case Gender.unknown:
      return Assets.icons.genderUnknown.svg();
    default:
      return Assets.icons.genderUnknown.svg();
  }
}

Widget _getStatusIcon(Status status) {
  switch (status) {
    case Status.alive:
      return Assets.icons.statusAlive.svg();
    case Status.dead:
      return Assets.icons.statusDead.svg();
    case Status.unknown:
      return Assets.icons.statusUnknown.svg();
    default:
      return Assets.icons.statusUnknown.svg();
  }
}

Widget _getSpeciesIcon(Species species) {
  switch (species) {
    case Species.human:
      return Assets.icons.speciesHuman.svg();
    case Species.alien:
      return Assets.icons.speciesAlien.svg();
    case Species.unknown:
      return Assets.icons.speciesAlien.svg();
    default:
      return Assets.icons.speciesHuman.svg();
  }
}
