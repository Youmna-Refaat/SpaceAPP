import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';
import 'home_screen.dart';

class ExploreScreen extends StatelessWidget {
  static const String routeName = "explore_screen";
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlack,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/explore.png",
              height: double.infinity,
              width: double.infinity,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Explore \nThe \nUniverse ",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: kWhite,
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    },
                    title: "Explore"))
          ],
        ),
      ),
    );
  }
}
