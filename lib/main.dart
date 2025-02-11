import 'package:flutter/material.dart';

import 'screens/explore_screen.dart';
import 'screens/home_screen.dart';
import 'screens/planet_details_screen.dart';

void main() {
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ExploreScreen.routeName,
      routes: {
        ExploreScreen.routeName: (context) => const ExploreScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        PlanetDetailsScreen.routeName: (context) => PlanetDetailsScreen(),
      },
    );
  }
}
