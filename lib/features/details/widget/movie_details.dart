import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/provider/selected_movie_provider.dart';

class MovieDetails extends ConsumerWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMovie = ref.watch(selectedMovieProvider);

    final relaseDate = selectedMovie?.releaseDate;

    return Padding(
      padding:
          const EdgeInsets.only(left: 50.0, top: 16, bottom: 24, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/calendar.svg',
            colorFilter:
                const ColorFilter.mode(Color(0xFF92929D), BlendMode.srcIn),
          ),
          const SizedBox(width: 4),
          Text(
            relaseDate?.year.toString()?? "unknown",
            style:const TextStyle(
              color: Color(0xFF92929D),
            ),
          ),
          const SizedBox(width: 12),
          const VerticalDivider(color: Color(0xFF92929D), thickness: 1),
          const SizedBox(width: 12),
          SvgPicture.asset(
            'assets/icons/clock.svg',
            colorFilter:
                const ColorFilter.mode(Color(0xFF92929D), BlendMode.srcIn),
          ),
          const SizedBox(width: 4),
          const Text(
            '148 Minutes',
            style: TextStyle(
              color: Color(0xFF92929D),
            ),
          ),
          const SizedBox(width: 12),
          const VerticalDivider(color: Color(0xFF92929D), thickness: 1),
          const SizedBox(width: 12),
          SvgPicture.asset(
            'assets/icons/ticket.svg',
            colorFilter:
                const ColorFilter.mode(Color(0xFF92929D), BlendMode.srcIn),
          ),
          const SizedBox(width: 4),
          const Text(
            "Actions",
            style: TextStyle(
              color: Color(0xFF92929D),
            ),
          ),
        ],
      ),
    );
  }
}
