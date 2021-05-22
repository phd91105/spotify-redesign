import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 80, 20, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Good morning',
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Icon(
            Feather.settings,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
