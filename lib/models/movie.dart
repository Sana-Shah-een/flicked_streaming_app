//Package
import 'package:get_it/get_it.dart';

//Models
import '../models/app_config.dart';

class Movie {
  late final String name;
  late final String language;
  late final bool isAdult;
  late final String posterPath;
  late final String backdropPath;
  late final num rating;
  late final String description;
  late final String releaseDate;

  Movie({
    required this.name,
    required this.language,
    required this.isAdult,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.description,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['title'] ?? 'Unknown',
      language: json['original_language'] ?? 'Unknown',
      isAdult: json['adult'] ?? false,
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      rating: json['vote_average']?.toDouble() ?? 0.0,
      description: json['overview'] ?? 'No description available',
      releaseDate: json['release_date'] ?? 'Unknown',
    );
  }
  String posterUrl() {
    final AppConfig appConfig = GetIt.instance<AppConfig>();
    return '${appConfig.BASE_IMAGE_API_URL}$posterPath';
  }
}
