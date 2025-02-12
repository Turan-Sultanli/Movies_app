import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/watchlist/widgets/empty_watchlist.dart';
import 'package:movies_app/features/watchlist/widgets/watchlist_item.dart';
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
        body: watchlist.isEmpty
            ? EmptyWatchlist as Widget
            : const WatchlistItem());
  }
}
