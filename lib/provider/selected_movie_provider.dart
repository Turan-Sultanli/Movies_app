import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/features/home/model/movies_model.dart';

final selectedMovieProvider = StateProvider<MoviesModel?>((ref) => null);