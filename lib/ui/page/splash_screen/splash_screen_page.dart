import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/ui/page/splash_screen/splash_screen_controller.dart';
import '../../../l10n/generated/l10n.dart';

class SplashScreenPage extends StatefulWidget {

  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final SplashScreenPageController controller = GetIt.I();

  @override
  void initState() {
    super.initState();
    controller.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(child: Container()),
              Text(tr.splash_screen_title_first, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 40),
              Text(tr.splash_screen_title_second, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 40),
              const CircularProgressIndicator(),
              Expanded(child: Container())
            ]
          ),
        ),
      )
    );
  }

}