import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/provider/movies_provider.dart';

class SearchResultItem extends ConsumerWidget {
  const SearchResultItem({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final searchResult = ref.watch(searchpageMovieProvider);

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: searchResult.length,
        itemBuilder: (context, index) {
          final movie = searchResult[index];
          return Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 30, right: 40),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                    width: 96,
                    height: 120,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          movie.title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 14),
                        //rating
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: SvgPicture.asset('assets/icons/star.svg'),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${movie.voteAverage?.toStringAsFixed(1)}',
                              style: const TextStyle(
                                  color: Color(0xFFFF8700),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(height: 6),
                        //ticket
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/ticket.svg'),
                            const SizedBox(width: 4),
                            const Text(
                              'Action',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const SizedBox(height: 6),
                        //calendar
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/calendar.svg'),
                            const SizedBox(width: 4),
                            Text(
                              movie.releaseDate != null
                                  ? movie.releaseDate!.year.toString()
                                  : 'Unknown',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
