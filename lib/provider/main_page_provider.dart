import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/main_page_data_controller.dart';
import '../models/main_page_data.dart';

/// MainPageDataController Provider
final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageDataController, MainPageData>(
      (ref) => MainPageDataController(),
    );

/// Selected Movie Poster URL Provider
final selectedMoviePosterUrlProvider = StateProvider<String>((ref) {
  final movies = ref.watch(mainPageDataControllerProvider).movies;
  return movies.isNotEmpty ? movies[0].posterUrl() : '';
});
