import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movies_app/core/constants/url_links.dart';

import '../../features/home/model/movies_model.dart';

//Slider ucun butun filmler cagiririq

class MovieService {
  Future<List<MoviesModel>> fetchAllMovies() async {
    List<MoviesModel> allMovies = [];
    final categories = ['now_playing', 'popular', 'top_rated', 'upcoming'];

    for (String category in categories) {
      final endPoint = Uri.parse(
          '${UrlLinks.baseUrl}/movie/$category?api_key=${UrlLinks.apiKey}&language=en-US&page=1');

      final response = await http.get(endPoint);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final movies = List<MoviesModel>.from(
            data['results'].map((e) => MoviesModel.fromJson(e)));
        allMovies.addAll(movies);
      } else {
        throw Exception('Failed to load movies');
      }
    }
    return allMovies;
  }

  // Grid ucun filtirleme  edirik ve movieleri tablara gore gosteririk

  Future<List<MoviesModel>> fetchFilteredMovies(String category) async {
    final response = await http.get(
      Uri.parse(
          '${UrlLinks.baseUrl}/movie/$category?api_key=${UrlLinks.apiKey}&language=en-US&page=1'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final movies = List<MoviesModel>.from(
          data['results'].map((e) => MoviesModel.fromJson(e)));
          return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
