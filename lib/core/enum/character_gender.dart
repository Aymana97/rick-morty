enum CharacterGender {
  Female, Male, Genderless, Unknown
}

extension CharacterGenderExtension on CharacterGender {

  String get name {
    switch (this) {
      case CharacterGender.Female:
        return "female";
      case CharacterGender.Male:
        return "male";
      case CharacterGender.Genderless:
        return "genderless";
      case CharacterGender.Unknown:
        return "unknown";
      default:
        return "";
    }
  }

}