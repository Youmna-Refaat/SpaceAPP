import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import '../constants.dart';
import '../planet_data.dart';

class PlanetDetailsScreen extends StatelessWidget {
  static const String routeName = "planet_details_screen";
  final Flutter3DController controller = Flutter3DController();
  PlanetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as PlanetData;

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
                padding: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: kPrimaryColor),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: kWhite,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                            ),
                            Text(
                              arguments.name,
                              style: const TextStyle(
                                color: kWhite,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              arguments.title,
                              style: const TextStyle(
                                color: kWhite,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                    height: 300,
                    child: Flutter3DViewer(
                      activeGestureInterceptor: true,
                      progressBarColor: kPrimaryColor,
                      enableTouch: true,
                      onProgress: (double progressValue) {
                        debugPrint('model loading progress : $progressValue');
                      },
                      onLoad: (String modelAddress) {
                        debugPrint('model loaded : $modelAddress');
                      },
                      onError: (String error) {
                        debugPrint('model failed to load : $error');
                      },
                      controller: controller,
                      src: arguments.model,
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "About",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    arguments.about,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: kWhite,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Distance from Sun (km): ${arguments.distanceFromSun}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kWhite,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Length of Day (hours): ${arguments.lengthOfDay}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kWhite,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Orbital Period (Earth years): ${arguments.opticalPeriod}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kWhite,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Radius (km): ${arguments.radius}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kWhite,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Mass (kg): ${arguments.mass}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kWhite,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Gravity (m/s²): ${arguments.gravity}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kWhite,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Surface Area (km²): ${arguments.surfaceArea}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kWhite,
                    ),
                  ),
                ),
                const SizedBox(height: 50)
              ],
            ),
          )
        ],
      ),
    );
  }
}
