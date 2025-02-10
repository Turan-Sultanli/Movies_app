import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/provider/movies_filter_provider.dart';

class MoviesFilterTabs extends ConsumerWidget {
  const MoviesFilterTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: const Color(0xFF3A3F47),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {
              ref.read(selectedCategoryProvider.notifier).state =
                  MovieCategory.values[index];
            },
            tabs: const [
              Tab(text: 'Now Playing'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Top Rated'),
              Tab(text: 'Popular'),
            ],
          ),
        ],
      ),
    );
  }
}
