import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spotify_redesign/screens/login.dart';

var accessToken;
Future<void> getAccessToken() async {
  print('Code in access token:' + code);

  var headers = <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': '*/*',
    'Authorization': 'Basic ' +
        'NWE3ODNkZTY2MTJlNGM0MzgxZDM5MzAxMTkzOWEyOWQ6NjIzZjViNzQyMDUxNDc5Y2JlNDQ2YWU4ZTM0NjE5NjM=',
  };

  var data = {
    'grant_type': 'authorization_code',
    'code': code,
    'redirect_uri': 'https://api.phamduy.host/'
  };

  var res = await http.post(Uri.parse('https://accounts.spotify.com/api/token'),
      headers: headers, body: data, encoding: Encoding.getByName("utf-8"));

  if (res.statusCode != 200)
    throw Exception('http.post error: statusCode= ${res.statusCode}');

  accessToken = json.decode(res.body);

  print(res.body);
  print(accessToken['access_token']);
}
