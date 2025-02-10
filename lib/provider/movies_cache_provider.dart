import 'package:movies_app/features/home/model/movies_model.dart';
import 'package:movies_app/provider/movies_filter_provider.dart';
import 'package:riverpod/riverpod.dart';

class MoviesCacheNotifier
    extends StateNotifier<Map<MovieCategory, List<MoviesModel>>> {
  MoviesCacheNotifier() : super({});

  void updateCache(MovieCategory category, List<MoviesModel> movies) {
    state = {...state, category: movies};
  }
}

final moviesCacheProvider = StateNotifierProvider<MoviesCacheNotifier,
    Map<MovieCategory, List<MoviesModel>>>((ref) => MoviesCacheNotifier());