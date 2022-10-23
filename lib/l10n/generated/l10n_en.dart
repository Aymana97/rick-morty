import 'l10n.dart';

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get back_button => 'Back';

  @override
  String get clear_button => 'Clear';

  @override
  String get filter_button => 'Filter';

  @override
  String get splash_screen_title_first => 'Discover the Universe of';

  @override
  String get splash_screen_title_second => 'Rick & Morty';

  @override
  String get characters_page_title => 'Characters list';

  @override
  String characters_page_characters_count(int count) {
    return 'Characters : $count';
  }

  @override
  String characters_page_selected_filters(String filters) {
    return 'Filters : $filters';
  }

  @override
  String get character_page_name => 'Name : ';

  @override
  String get character_page_status => 'Status : ';

  @override
  String get character_page_specie => 'Species : ';

  @override
  String get character_page_type => 'Type : ';

  @override
  String get character_page_gender => 'Gender : ';

  @override
  String get character_page_date => 'Created : ';

  @override
  String character_page_episode_list(int count) {
    return 'Episodes list ($count)';
  }

  @override
  String get filter_menu_title => 'Filter characters';

  @override
  String get filter_menu_status => 'Filter on status :';

  @override
  String get filter_menu_gender => 'Filter on gender :';

  @override
  String episodes_menu_title(String name) {
    return '$name episodes :';
  }

  @override
  String episodes_menu_episode_name(String episode, String name) {
    return '$episode - $name';
  }
}
