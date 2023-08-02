
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Nguyen Van Quang",
              style: TextStyle(
                  fontSize: 18,
                  height: 0.8,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "08_DH_TMDT",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        ClipOval(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Image.asset(
              "assets/images/anhdaidien.jpg",
            ),
          ),
        ),

        // ignore: prefer_const_constructors

      ],
    );
  }
}
