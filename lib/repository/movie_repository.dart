import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_minggu_4_2/mixins/server.dart';
import 'package:flutter_minggu_4_2/model/movie.dart';

class MovieRepository {
  Future<List<Movie>> getMovie(int page) async {
    http.Response value = await http.get(
      Uri.parse(Server.alamat_api +
          "/3/movie/top_rated?api_key=${Server.api_key}" +
          "&page=${page}"),
    );
    if (value.statusCode == 200) {
      Map<String, dynamic> response = json.decode(value.body);
      List<dynamic> list_data = response["results"];
      List<Movie> list_movie =
          list_data.map((dynamic element) => Movie.fromMap(element)).toList();
      return list_movie;
    } else {
      throw Exception();
    }
  }
}
