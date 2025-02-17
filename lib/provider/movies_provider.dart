import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/data/service/movie_service.dart';
import 'package:movies_app/provider/movies_cache_provider.dart';
import 'package:movies_app/provider/movies_filter_provider.dart';
import 'package:movies_app/provider/search_query_provider.dart';

import '../features/home/model/movies_model.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  return MovieService();
});

//Slider ucun
final allMoviesProvider = FutureProvider<List<dynamic>>((ref) async {
  final movieService = ref.watch(movieServiceProvider);
  return await movieService.fetchAllMovies();
});

final filteredSliderMoviesProvider =
    FutureProvider<List<MoviesModel>>((ref) async {
  final movieService = ref.watch(movieServiceProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  if (searchQuery.isEmpty) {
    return await movieService.fetchAllMovies();
  }

  final allMovies = await movieService.fetchAllMovies();
  final filteredMovies = allMovies.where((movie) {
    final movieTitle =
        (movie.title ?? movie.originalTitle ?? '').toString().toLowerCase();
    return movieTitle.startsWith(searchQuery) ||
        movieTitle.contains(searchQuery);
  }).toList();

  return filteredMovies;
});

final searchpageMovieProvider = FutureProvider<List<MoviesModel>>((ref) async {
  final movieService = ref.watch(movieServiceProvider);
  final searchQuery = ref.watch(searchpageMovieProvider);

  if (searchQuery.isEmpty) {
    return await movieService.fetchAllMovies();
  }

  final allMovies = await movieService.fetchAllMovies();
  final filteredMovies = allMovies.where((movie) {
    final movieTitle =
        (movie.title ?? movie.originalTitle ?? '').toString().toLowerCase();
    return movieTitle.startsWith(searchQuery) ||
        movieTitle.contains(searchQuery);
  }).toList();

  return filteredMovies;
});

//Grid ucun
final moviesProvider =
    FutureProvider.autoDispose<List<MoviesModel>>((ref) async {
  final movieService = ref.watch(movieServiceProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final moviesCache = ref.watch(moviesCacheProvider);

  List<MoviesModel> movies = [];

  if (moviesCache[selectedCategory] != null) {
    movies = moviesCache[selectedCategory]!;
  } else {
    String categoryEndpoint;
    switch (selectedCategory) {
      case MovieCategory.nowPlaying:
        categoryEndpoint = 'now_playing';
        break;
      case MovieCategory.popular:
        categoryEndpoint = 'popular';
        break;
      case MovieCategory.topRated:
        categoryEndpoint = 'top_rated';
        break;
      case MovieCategory.upcoming:
        categoryEndpoint = 'upcoming';
        break;
    }

    movies = await movieService.fetchFilteredMovies(categoryEndpoint);
    ref
        .read(moviesCacheProvider.notifier)
        .updateCache(selectedCategory, movies);
  }
  return movies;
});
