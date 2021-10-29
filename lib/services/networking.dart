// ignore_for_file: avoid_print


import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});

  // final String url;
  final Uri url;

  Future<dynamic> getData() async {
    // http.Response response = await http.get(Uri.parse(url));
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
