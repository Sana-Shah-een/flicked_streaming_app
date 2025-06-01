import 'package:dio/dio.dart';
import 'package:flicked_app/models/movie.dart';
import 'package:flicked_app/services/http_service.dart';
import 'package:get_it/get_it.dart';

// //Services
// import './http_service.dart';

// //Models
// import '../models/movie.dart';

class MovieService {
  final getIt = GetIt.instance;
  late HttpService http;

  MovieService() {
    http = getIt.get<HttpService>();
  }
  Future<List<Movie>> getPopularMovies({page}) async {
    Response response = await http.get('/movie/popular', query: {'page': page});

    if (response.statusCode == 200) {
      Map data = response.data;
      List<Movie> movies =
          data['results'].map<Movie>((movieData) {
            return Movie.fromJson(movieData);
          }).toList();
      return movies;
    } else {
      throw Exception('Failed to load popular movies: ${response.statusCode}');
    }
  }

  Future<List<Movie>> getUpcomingMovies({page}) async {
    Response response = await http.get(
      '/movie/upcoming',
      query: {'page': page},
    );

    if (response.statusCode == 200) {
      Map data = response.data;
      List<Movie> movies =
          data['results'].map<Movie>((movieData) {
            return Movie.fromJson(movieData);
          }).toList();
      return movies;
    } else {
      throw Exception('Failed to load upcoming movies: ${response.statusCode}');
    }
  }

  Future<List<Movie>> getTopRatedMovies({page}) async {
    Response response = await http.get(
      '/movie/now_playing',
      query: {'page': page},
    );

    if (response.statusCode == 200) {
      Map data = response.data;
      List<Movie> movies =
          data['results'].map<Movie>((movieData) {
            return Movie.fromJson(movieData);
          }).toList();
      return movies;
    } else {
      throw Exception(
        'Failed to load top_rated movies: ${response.statusCode}',
      );
    }
  }

  Future<List<Movie>> getNowPlayingMovies({page}) async {
    Response response = await http.get(
      '/movie/top_rated',
      query: {'page': page},
    );

    if (response.statusCode == 200) {
      Map data = response.data;
      List<Movie> movies =
          data['results'].map<Movie>((movieData) {
            return Movie.fromJson(movieData);
          }).toList();
      return movies;
    } else {
      throw Exception(
        'Failed to load now_playing movies: ${response.statusCode}',
      );
    }
  }

  Future<List<Movie>> searchMovie(String searchTerm, {page}) async {
    Response response = await http.get(
      '/search/movie',
      query: {'query': searchTerm, 'page': page},
    );

    if (response.statusCode == 200) {
      Map data = response.data;
      List<Movie> movies =
          data['results'].map<Movie>((movieData) {
            return Movie.fromJson(movieData);
          }).toList();
      return movies;
    } else {
      throw Exception(
        'Could\'nt perform movies search: ${response.statusCode}',
      );
    }
  }
}
