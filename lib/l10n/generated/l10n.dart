import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_fr.dart';

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @back_button.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get back_button;

  /// No description provided for @clear_button.
  ///
  /// In fr, this message translates to:
  /// **'Clear'**
  String get clear_button;

  /// No description provided for @filter_button.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer'**
  String get filter_button;

  /// No description provided for @splash_screen_title_first.
  ///
  /// In fr, this message translates to:
  /// **'Découvrez l\'Univers de'**
  String get splash_screen_title_first;

  /// No description provided for @splash_screen_title_second.
  ///
  /// In fr, this message translates to:
  /// **'Rick & Morty'**
  String get splash_screen_title_second;

  /// No description provided for @characters_page_title.
  ///
  /// In fr, this message translates to:
  /// **'Liste des personnages'**
  String get characters_page_title;

  /// No description provided for @characters_page_characters_count.
  ///
  /// In fr, this message translates to:
  /// **'Personnages : {count}'**
  String characters_page_characters_count(int count);

  /// No description provided for @characters_page_selected_filters.
  ///
  /// In fr, this message translates to:
  /// **'Filtres : {filters}'**
  String characters_page_selected_filters(String filters);

  /// No description provided for @character_page_name.
  ///
  /// In fr, this message translates to:
  /// **'Nom : '**
  String get character_page_name;

  /// No description provided for @character_page_status.
  ///
  /// In fr, this message translates to:
  /// **'Statut : '**
  String get character_page_status;

  /// No description provided for @character_page_specie.
  ///
  /// In fr, this message translates to:
  /// **'Èspece : '**
  String get character_page_specie;

  /// No description provided for @character_page_type.
  ///
  /// In fr, this message translates to:
  /// **'Type : '**
  String get character_page_type;

  /// No description provided for @character_page_gender.
  ///
  /// In fr, this message translates to:
  /// **'Genre : '**
  String get character_page_gender;

  /// No description provided for @character_page_date.
  ///
  /// In fr, this message translates to:
  /// **'Créé le : '**
  String get character_page_date;

  /// No description provided for @character_page_episode_list.
  ///
  /// In fr, this message translates to:
  /// **'Liste des épisodes ({count})'**
  String character_page_episode_list(int count);

  /// No description provided for @filter_menu_title.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer les personnages'**
  String get filter_menu_title;

  /// No description provided for @filter_menu_status.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer sur le statut :'**
  String get filter_menu_status;

  /// No description provided for @filter_menu_gender.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer sur le genre :'**
  String get filter_menu_gender;

  /// No description provided for @episodes_menu_title.
  ///
  /// In fr, this message translates to:
  /// **'Liste des épisodes de {name} :'**
  String episodes_menu_title(String name);

  /// No description provided for @episodes_menu_episode_name.
  ///
  /// In fr, this message translates to:
  /// **'{episode} - {name}'**
  String episodes_menu_episode_name(String episode, String name);
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return SEn();
    case 'fr': return SFr();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
