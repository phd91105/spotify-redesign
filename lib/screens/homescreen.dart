import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:spotify_redesign/utils/constants.dart';
import 'package:spotify_redesign/utils/mock.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          height: 160,
          padding: EdgeInsets.only(top: 16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Good morning',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Icon(
                  Feather.settings,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryBlue,
                primaryBlack,
              ],
            ),
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeSlider(),
              SizedBox(
                height: 36,
              ),
              Text(
                'Recently played',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SmallCard(
                      title: 'Liked Songs',
                      image: AssetImage('assets/likedsong.png'),
                    ),
                    SmallCard(
                      title: 'Liked Songs',
                      image: AssetImage('assets/likedsong.png'),
                    ),
                    SmallCard(
                      title: 'Liked Songs',
                      image: AssetImage('assets/likedsong.png'),
                    ),
                    SmallCard(
                      title: 'Liked Songs',
                      image: AssetImage('assets/likedsong.png'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryBlack,
        selectedItemColor: primaryBlue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.list,
            ),
            label: 'Playlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.user,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  const SmallCard({
    Key key,
    this.title,
    this.image,
  }) : super(key: key);
  final String title;
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
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        initialPage: 0,
        autoPlay: true,
        viewportFraction: 0.6,
      ),
      items: recentItem.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(item['image']),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Color(0xff2f2f31),
                    ),
                    child: Center(
                      child: Text(
                        item['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
