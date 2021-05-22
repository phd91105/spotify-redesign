import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_redesign/widgets/bottom_bar.dart';
import 'package:spotify_redesign/widgets/navbar.dart';
import 'package:spotify_redesign/widgets/slider.dart';
import 'package:spotify_redesign/widgets/small_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: PreferredSize(
        child: Navbar(),
        preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
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
                  fontSize: 26,
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
                      title: 'Chill Covers',
                      image: NetworkImage(
                          'https://i.scdn.co/image/ab67706f000000032c201c20673048a3202c7138'),
                      desc: 'Joy Oladokun',
                    ),
                    SmallCard(
                      title: 'Classical Sleep',
                      image: NetworkImage(
                          'https://i.scdn.co/image/ab67706f000000038f5b6bf8fd58ce6ab15e037a'),
                      desc: 'Drift off to these peaceful',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Jump back in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
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
                      title: 'Chill Covers',
                      image: NetworkImage(
                          'https://i.scdn.co/image/ab67706f000000032c201c20673048a3202c7138'),
                      desc: 'Joy Oladokun',
                    ),
                    SmallCard(
                      title: 'Classical Sleep',
                      image: NetworkImage(
                          'https://i.scdn.co/image/ab67706f000000038f5b6bf8fd58ce6ab15e037a'),
                      desc: 'Drift off to these peaceful',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
