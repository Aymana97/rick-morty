import 'l10n.dart';

/// The translations for French (`fr`).
class SFr extends S {
  SFr([String locale = 'fr']) : super(locale);

  @override
  String get back_button => 'Retour';

  @override
  String get clear_button => 'Clear';

  @override
  String get filter_button => 'Filtrer';

  @override
  String get splash_screen_title_first => 'Découvrez l\'Univers de';

  @override
  String get splash_screen_title_second => 'Rick & Morty';

  @override
  String get characters_page_title => 'Liste des personnages';

  @override
  String characters_page_characters_count(int count) {
    return 'Personnages : $count';
  }

  @override
  String characters_page_selected_filters(String filters) {
    return 'Filtres : $filters';
  }

  @override
  String get character_page_name => 'Nom : ';

  @override
  String get character_page_status => 'Statut : ';

  @override
  String get character_page_specie => 'Èspece : ';

  @override
  String get character_page_type => 'Type : ';

  @override
  String get character_page_gender => 'Genre : ';

  @override
  String get character_page_date => 'Créé le : ';

  @override
  String character_page_episode_list(int count) {
    return 'Liste des épisodes ($count)';
  }

  @override
  String get filter_menu_title => 'Filtrer les personnages';

  @override
  String get filter_menu_status => 'Filtrer sur le statut :';

  @override
  String get filter_menu_gender => 'Filtrer sur le genre :';

  @override
  String episodes_menu_title(String name) {
    return 'Liste des épisodes de $name :';
  }

  @override
  String episodes_menu_episode_name(String episode, String name) {
    return '$episode - $name';
  }
}
