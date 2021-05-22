import 'package:flutter/material.dart';
import 'package:spotify_redesign/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _url =
        'https://accounts.spotify.com/vi-VN/authorize?scope=user-read-recently-played%20user-top-read%20user-read-playback-position%20user-read-playback-state%20user-modify-playback-state%20user-read-currently-playing%20streaming%20playlist-modify-public%20playlist-modify-private%20playlist-read-private%20playlist-read-collaborative%20user-library-modify%20user-library-read%20user-read-email%20user-read-private&response_type=token&redirect_uri=https:%2F%2Fexample.com%2Fcallback&client_id=5a783de6612e4c4381d393011939a29d';
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not launch $_url';
    return Container(
      color: primaryBlack,
      child: Center(
        child: SizedBox(
          height: 60,
          width: 220,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            onPressed: _launchURL,
            child: Text(
              'Login Spotify',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
