import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/provider/selected_movie_provider.dart';

class AboutMovie extends ConsumerWidget {
  const AboutMovie({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final movie = ref.watch(selectedMovieProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        '${movie?.overview}',
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
