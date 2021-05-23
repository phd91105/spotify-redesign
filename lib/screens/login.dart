import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:spotify_redesign/screens/home.dart';
import 'package:spotify_redesign/services/access_token.dart';
import 'package:spotify_redesign/services/topTrack.dart';
import 'package:spotify_redesign/utils/constants.dart';

String code;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => Get.to(MyHomePage()),
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  StreamSubscription<String> _onUrlChanged;

  @override
  void initState() {
    super.initState();

    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen(
      (String url) async {
        if (mounted) {
          var res = await http.get(Uri.parse(url));
          // print('Current URL: $url');
          // print('Status code: ' + res.request.headers.toString());

          code = res.request.url.queryParameters['code'];
          print('Authorization Code: ' + code);
          flutterWebviewPlugin.close();
          await getAccessToken();
          await getTracks();
          Get.offAll(() => HomeScreen());
        }
      },
    );
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const clientID = '5a783de6612e4c4381d393011939a29d';
    const redirectUri = 'https://api.phamduy.host/';
    const scope =
        'user-read-recently-played%20user-top-read%20user-read-playback-position%20user-read-playback-state%20user-modify-playback-state%20user-read-currently-playing%20streaming%20playlist-modify-public%20playlist-modify-private%20playlist-read-private%20playlist-read-collaborative%20user-library-modify%20user-library-read%20user-read-email%20user-read-private';
    return WebviewScaffold(
      key: scaffoldKey,
      url:
          'https://accounts.spotify.com/authorize?client_id=$clientID&response_type=code&redirect_uri=$redirectUri&scope=$scope&show_dialog=true',
      hidden: true,
    );
  }
}
