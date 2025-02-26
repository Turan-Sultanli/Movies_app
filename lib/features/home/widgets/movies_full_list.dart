import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/details/screen/details_page_screen.dart';
import 'package:movies_app/provider/movies_provider.dart';
import 'package:movies_app/provider/selected_movie_provider.dart';

class MoviesFullList extends ConsumerWidget {
  const MoviesFullList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAysnc = ref.watch(filteredSliderMoviesProvider);

    return SizedBox(
      height: 200,
      child: moviesAysnc.when(
        data: (movies) => ListView.builder(
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final movie = movies[index];
            final posterPath = movie.posterPath;
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(selectedMovieProvider.notifier).state = movie;
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsPageScreen(movie),
                    ));
                  },
                  child: Hero(
                    tag: "movie_${movie.id}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/$posterPath',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16)
              ],
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
