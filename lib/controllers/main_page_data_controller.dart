//Packages
// ignore_for_file: avoid_print

import 'package:flicked_app/models/main_page_data.dart';
import 'package:flicked_app/models/movie.dart';
import 'package:flicked_app/models/search_category.dart';
import 'package:flicked_app/services/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

// //Models
// import '../models/main_page_data.dart';
// import '../models/movie.dart';
// import '../models/search_category.dart';

// //Services
// import '../services/movie_service.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController({MainPageData? state})
    : super(state ?? MainPageData.initial()) {
    getMovies();
  }

  final movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie> movies = [];

      if (state.searchText.isNotEmpty) {
        // Perform text search
        movies = await movieService.searchMovie(
          state.searchText,
          page: state.page,
        );
      } else {
        // Perform category-based search
        if (state.searchCategory == SearchCategory.popular) {
          movies = await movieService.getPopularMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.upComing) {
          movies = await movieService.getUpcomingMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.none) {
          movies = [];
        } else if (state.searchCategory == SearchCategory.topRated) {
          movies = await movieService.getTopRatedMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.nowPlaying) {
          movies = await movieService.getNowPlayingMovies(page: state.page);
        }
      }

      state = state.copyWith(
        movies: [...state.movies, ...movies],
        page: state.page + 1,
      );
    } catch (e) {
      // print('Error fetching movies: $e');
      throw Exception('Error fetching movies: $e');
    }
  }

  void updateSearchCategory(String category) {
    try {
      state = state.copyWith(
        movies: [],
        page: 1,
        searchCategory: category,
        searchText: '',
      );
      getMovies();
    } catch (e) {
      // print('Error updating search category: $e');
      throw Exception('Error updating search category: $e');
    }
  }

  void updateTextSearch(String searchText) {
    try {
      state = state.copyWith(movies: [], page: 1, searchText: searchText);
      getMovies();
    } catch (e) {
      // print('Error updating search text: $e');
      throw Exception('Error updating search text: $e');
    }
  }
}
