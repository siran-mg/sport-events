import 'package:flutter/material.dart';

class AppButtonNavigationBar extends StatelessWidget {
  const AppButtonNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
        BottomNavigationBarItem(icon: Icon(Icons.event), label: "Evénements"),
      ],
    );
  }
}
