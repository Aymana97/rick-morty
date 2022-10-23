import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/core/navigation/app_routes.gr.dart';

@injectable
class SplashScreenPageController {

  final int _splashWaitTime = 2;

  init(BuildContext context) async {
    Future.delayed(Duration(seconds: _splashWaitTime)).then((value) {
      context.router.replace(const CharactersRoute());
    });
  }

}