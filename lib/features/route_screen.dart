import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/home/home_page.dart';
import 'package:movies_app/features/search/screens/search_page_screen.dart';
import 'package:movies_app/features/watchlist/watchlist_page_screen.dart';

final bottomNavProvider = StateProvider<int>((ref) => 0);

class RouteScreen extends ConsumerWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final pages = [
      const HomePage(),
      const SearchPage(),
      const WatchlistPage(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: Colors.blue[300],
        unselectedItemColor: const Color(0xFF67686D),
        currentIndex: currentIndex,
        onTap: (index) => ref.read(bottomNavProvider.notifier).state = index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: 'Watch List')
        ],
      ),
    );
  }
}
