import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MovieCategory {nowPlaying, upcoming, topRated, popular}


final selectedCategoryProvider = StateProvider<MovieCategory>((ref) {
    return MovieCategory.nowPlaying;
});

