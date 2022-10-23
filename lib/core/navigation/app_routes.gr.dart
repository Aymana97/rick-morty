// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../domain/entity/character.dart' as _i6;
import '../../ui/page/character/character_page.dart' as _i3;
import '../../ui/page/characters/characters_page.dart' as _i2;
import '../../ui/page/splash_screen/splash_screen_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreenPage(),
      );
    },
    CharactersRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CharactersPage(),
      );
    },
    CharacterRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.CharacterPage(
          key: args.key,
          character: args.character,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          CharactersRoute.name,
          path: '/characters',
        ),
        _i4.RouteConfig(
          CharacterRoute.name,
          path: '/character',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreenPage]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.CharactersPage]
class CharactersRoute extends _i4.PageRouteInfo<void> {
  const CharactersRoute()
      : super(
          CharactersRoute.name,
          path: '/characters',
        );

  static const String name = 'CharactersRoute';
}

/// generated route for
/// [_i3.CharacterPage]
class CharacterRoute extends _i4.PageRouteInfo<CharacterRouteArgs> {
  CharacterRoute({
    _i5.Key? key,
    required _i6.Character character,
  }) : super(
          CharacterRoute.name,
          path: '/character',
          args: CharacterRouteArgs(
            key: key,
            character: character,
          ),
        );

  static const String name = 'CharacterRoute';
}

class CharacterRouteArgs {
  const CharacterRouteArgs({
    this.key,
    required this.character,
  });

  final _i5.Key? key;

  final _i6.Character character;

  @override
  String toString() {
    return 'CharacterRouteArgs{key: $key, character: $character}';
  }
}
