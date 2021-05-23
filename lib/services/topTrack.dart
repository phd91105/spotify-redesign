import 'dart:convert';

import 'package:spotify_redesign/services/access_token.dart';
import 'package:http/http.dart' as http;

Future<void> getTracks() async {
  var _accessToken = accessToken['access_token'];
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $_accessToken',
  };

  var params = {
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var res = await http.get(
      Uri.parse('https://api.spotify.com/v1/me/top/tracks?$query'),
      headers: headers);
  if (res.statusCode != 200)
    throw Exception('http.get error: statusCode= ${res.statusCode}');

  Map topTracks = await json.decode(res.body.toString());
  for (int i = 0; i < 10; i++) {
    var artistsMap = topTracks['items'][i]['name'];
    print(artistsMap.toString());
  }
}
