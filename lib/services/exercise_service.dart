import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/exercise.dart';

class ExerciseService {
  static const String _baseUrl =
      "https://exercisedb-api1.p.rapidapi.com/api/v1/exercises?limit=25";

  static const Map<String, String> _headers = {
    "X-RapidAPI-Key": "493b404891msh5356df915b2a88ep1a7ffbjsn8e4038019937",
    "X-RapidAPI-Host": "exercisedb-api1.p.rapidapi.com",
  };

  static Future<List<Exercise>> fetchExercises({String? bodyPart}) async {
    String url = _baseUrl;

    if (bodyPart != null && bodyPart.isNotEmpty) {
      url += "&bodyParts=$bodyPart";
    }

    final res = await http.get(Uri.parse(url), headers: _headers);

    if (res.statusCode != 200) {
      throw Exception("Failed to fetch exercises: ${res.statusCode}");
    }

    final body = jsonDecode(res.body);
    final List data = body['data'];

    return data.map((e) => Exercise.fromJson(e)).toList();
  }
}
