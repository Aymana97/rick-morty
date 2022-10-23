import 'package:flutter/material.dart';
import 'core/navigation/app_routes.gr.dart';
import 'l10n/generated/l10n.dart';

class MyRickAndMortyApp extends StatelessWidget {

  final String appName;

  MyRickAndMortyApp({super.key, required this.appName});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routeInformationProvider: _appRouter.routeInfoProvider(),
        title: appName,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue,
          useMaterial3: true
        )
    );
  }
}