import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/ui/page/character/character_page.dart';
import 'package:rick_and_morty/ui/page/characters/characters_page.dart';
import 'package:rick_and_morty/ui/page/splash_screen/splash_screen_page.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: SplashScreenPage,
      initial: true
    ),
    AutoRoute(
      path: '/characters',
      page: CharactersPage
    ),
    AutoRoute(
      path: '/character',
      page: CharacterPage
    )  
  ]
)
class $AppRouter {}