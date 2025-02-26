import 'package:riverpod/riverpod.dart';

final searchQueryProvider = StateProvider.autoDispose<String>((ref) => '');
