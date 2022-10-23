import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  
  final bool visible;
  final Function action;
  final IconData icon;

  const NavigationButton({super.key, required this.visible, required this.action, required this.icon});


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: ElevatedButton(
        onPressed: () => action.call(),
        child: Icon(icon)
      )
    );
  }

}