import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:spotify_redesign/utils/constants.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: kTabBarColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(40),
                blurRadius: 6,
                offset: const Offset(0, 0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(45),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://i.scdn.co/image/ab67616d00001e0215e10e6b6279d532894feb7e'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      child: Text(
                        'Có một người từng là tất cả',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: 140,
                      child: Text(
                        'Juky San' ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              TabItem(
                name: 'PROFILE',
                icon: Feather.heart,
                tapEvent: () {},
                isActive: false,
              ),
              TabItem(
                name: 'PROFILE',
                icon: Feather.play,
                tapEvent: () {},
                isActive: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key key,
    @required this.icon,
    @required this.name,
    @required this.tapEvent,
    @required this.isActive,
  }) : super(key: key);

  final String name;
  final GestureTapCallback tapEvent;
  final bool isActive;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5.0),
        height: 60.0,
        width: 60.0,
        child: Icon(
          icon,
          size: 26,
          color: isActive ? primaryBlue : Colors.white,
        ),
      ),
    );
  }
}
