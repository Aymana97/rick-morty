import 'package:flutter/material.dart';
import 'package:rick_and_morty/app.dart';
import 'package:rick_and_morty/di/inject.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Dependance Injection init.
  injectDependencies();

  runApp(MyRickAndMortyApp(appName: 'Rick & Morty FanBase'));
}
