import 'package:flutter/material.dart';

Widget customHomeAppBar(String firstText, String secondText) {
  return RichText(
    text: TextSpan(
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: firstText,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
          const TextSpan(text: ' '),
          TextSpan(
              text: secondText,
              style: const TextStyle(color: Colors.blueAccent)),
        ]),
  );
}
