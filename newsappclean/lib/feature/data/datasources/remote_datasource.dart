import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsappclean/config/api_config.dart';
import 'package:newsappclean/core/errors/exceptions.dart';
import 'package:newsappclean/feature/data/models/articles_model.dart';

late Future<List<Articles>> result;
Map<String, dynamic> value = {};
List<dynamic> data = [];

Future<List<Articles>> fetchApi() async {
  var url = Uri.parse(
      '${ApiConfig.baseUrl}top-headlines?country=us&apiKey=${ApiConfig.apiKey}');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    value = jsonDecode(response.body);
    data = value['articles'];
    return data.map((e) => Articles.fromJson(e)).toList();
  } else {
    throw ServerException('Failed to load data');
  }
}
