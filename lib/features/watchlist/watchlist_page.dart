import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/provider/watchlist_provider.dart';

class WatchlistPage extends ConsumerWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final watchlist = ref.watch(watchlistProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Center(
          child: Text(
            'Watchlist',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: watchlist.length,
        itemBuilder: (context, index) {
          final movie = watchlist[index];

          return Container(
            padding: const EdgeInsets.all(24),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    // 'assets/images/spiderman.png',
                    "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                    fit: BoxFit.cover,
                    height: 160,
                    width: 120,
                  ),
                ),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/star.svg'),
                        const SizedBox(width: 8),
                        Text(
                          (movie.voteAverage ?? 0).toStringAsFixed(1),
                          style: const TextStyle(color: Color(0xFFFF8700)),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/ticket.svg'),
                        const SizedBox(width: 8),
                        const Text(
                          'Action',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/calendar.svg'),
                        const SizedBox(width: 8),
                        Text(
                          movie.releaseDate != null
                              ? movie.releaseDate!.year.toString()
                              : 'Unknown',
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/clock.svg'),
                        const SizedBox(width: 8),
                        const Text(
                          '139 minutes',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
