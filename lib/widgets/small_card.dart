import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({
    Key key,
    this.title,
    this.image,
    this.desc,
  }) : super(key: key);
  final String title, desc;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: image,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.only(left: 4),
            width: 140,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.only(left: 4),
            width: 140,
            child: Text(
              desc ?? '',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
