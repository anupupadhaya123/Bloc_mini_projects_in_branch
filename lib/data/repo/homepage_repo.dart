import 'dart:convert';

import 'package:http/http.dart' as http;

import '../API/api.dart';
import '../models/homepage_model.dart';

abstract class HomePageRepository {
  Future<List<HomepageModel>> fetchDetails();
}

class HomePageRepo extends HomePageRepository {
  @override
  Future<List<HomepageModel>> fetchDetails() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((p) => HomepageModel.fromMap(p))
          .toList();
    } else {
      throw Exception('Failed to load API data');
    }
  }
}
