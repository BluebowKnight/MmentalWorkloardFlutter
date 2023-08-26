import 'dart:convert';
//import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Decoder{

  Future<List<dynamic>> decodeFromUrl(String uri) async{
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return [];
    }
    return jsonDecode(response.body);
  }

  Future<List<dynamic>> decodeFromFile(String path) async{
    final filedata = await rootBundle.loadString(path);
    return jsonDecode(filedata);
  }

}