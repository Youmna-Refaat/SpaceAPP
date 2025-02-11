import 'package:flutter/material.dart';

import '../constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kWhite,
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: kWhite,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
