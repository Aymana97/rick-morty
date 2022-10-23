enum CharacterStatus {
  Alive, Dead, Unknown
}

extension CharacterStatusExtension on CharacterStatus {

  String get name {
    switch (this) {
      case CharacterStatus.Alive:
        return "alive";
      case CharacterStatus.Dead:
        return "dead";
      case CharacterStatus.Unknown:
        return "unknown";
      default:
        return "";
    }
  }

}