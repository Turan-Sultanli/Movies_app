import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/home/model/movies_model.dart';

class WatchlistNotifier extends StateNotifier<List<MoviesModel>> {
  WatchlistNotifier() : super([]);

  void addMovie(MoviesModel movie) {
    state = [...state, movie];
  }

  void removeMovie(int movieId) {
    state = state.where((m) => m.id != movieId).toList();
  }

  bool isInWatchlist(int movieId) {
    return state.any((movie) => movieId == movie.id);
  }
}

final watchlistProvider =
    StateNotifierProvider<WatchlistNotifier, List<MoviesModel>>(
        (ref) => WatchlistNotifier());
