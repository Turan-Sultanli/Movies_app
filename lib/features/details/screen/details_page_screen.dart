import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/features/details/widget/details_tabs.dart';
import 'package:movies_app/features/details/widget/movie_details.dart';
import 'package:movies_app/provider/selected_movie_provider.dart';

class DetailsPageScreen extends ConsumerWidget {
  const DetailsPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppBar(
                  actions: [
                    SvgPicture.asset('assets/icons/watchlist_white.svg'),
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
