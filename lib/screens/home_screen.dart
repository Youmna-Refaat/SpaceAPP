import 'package:flutter/material.dart';

import '../constants.dart';
import '../planet_data.dart';
import '../widgets/custom_button.dart';
import 'planet_details_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  int index = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(listenOnPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/upperImage.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "Explore",
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Which planet \nwould you like to explore?",
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(PlanetData.planets[index % 9].image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: kPrimaryColor),
                  onPressed: () {
                    pageController.animateToPage(
                        pageController.page!.toInt() - 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInSine);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: kWhite,
                  ),
                ),
                Expanded(
                  child: Text(
                    PlanetData.planets[index].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: kWhite,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: kPrimaryColor),
                  onPressed: () {
                    pageController.animateToPage(
                        pageController.page!.toInt() + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInSine);
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: kWhite,
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PlanetDetailsScreen.routeName,
                    arguments: PlanetData.planets[index]);
              },
              title: "Explore  ${PlanetData.planets[index].name}")
        ],
      ),
    );
  }

  void listenOnPage() {
    setState(() {});
    if (pageController.page! % 1 == 0) {
      index = pageController.page!.toInt() % 9;
    }
  }
}
