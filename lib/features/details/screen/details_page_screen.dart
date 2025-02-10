import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/details/widget/details_tabs.dart';
import 'package:movies_app/features/details/widget/movie_details.dart';
import 'package:movies_app/features/home/model/movies_model.dart';
import 'package:movies_app/provider/selected_movie_provider.dart';
import 'package:movies_app/provider/watchlist_provider.dart';

class DetailsPageScreen extends ConsumerWidget {
  const DetailsPageScreen(this.movie, {super.key});
  final MoviesModel movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final watchlist = ref.watch(watchlistProvider);
    final isAdded = ref.watch(watchlistProvider).any((m) => m.id == movie.id);

    final selectedMovie = ref.watch(selectedMovieProvider);

    final backdropPath = selectedMovie?.backdropPath != null
        ? "https://image.tmdb.org/t/p/w780${selectedMovie?.backdropPath}"
        : "https://image.tmdb.org/t/p/w780${selectedMovie?.posterPath}";

    return selectedMovie == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(36),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: AppBar(
                  actions: [
                    IconButton(
                        onPressed: () {
                          isAdded
                              ? ref
                                  .read(watchlistProvider.notifier)
                                  .removeMovie(movie.id!)
                              : ref
                                  .read(watchlistProvider.notifier)
                                  .addMovie(movie);
                        },
                        icon: isAdded
                            ? const Icon(Icons.bookmark_outlined)
                            : const Icon(Icons.bookmark_border_outlined))
                  ],
                  title: const Center(
                    child: Text(
                      'Details',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Image.network(
                      backdropPath,
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const IntrinsicHeight(child: MovieDetails()),
                const Expanded(child: DetailsTabs()),
              ],
            ),
          );
  }
}
